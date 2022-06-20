//
//  BluetoothManager.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 6/17/22.
//

import Foundation
import CoreBluetooth

class BluetoothManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    
    @Published var bleIsOn = false
    @Published var peripherals = [Peripheral]()
    
    var centralManager: CBCentralManager!
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        centralManager.delegate = self
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        bleIsOn = (central.state == .poweredOn)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var broadcastName: String
       
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            broadcastName = name
        } else {
            broadcastName = "Unknown"
        }
       
        let newPeripheral = Peripheral(id: peripherals.count, broadcastName: broadcastName, rssi: RSSI.intValue)
        if !peripherals.contains(where: { $0.broadcastName == newPeripheral.broadcastName }) {
            peripherals.append(newPeripheral)
            peripherals.sort {$0.rssi > $1.rssi}
        }
    }
    
    func startScanning() {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func stopScanning() {
        centralManager.stopScan()
    }
}
