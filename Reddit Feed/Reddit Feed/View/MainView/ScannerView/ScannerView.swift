//
//  ScannerView.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 6/16/22.
//

import SwiftUI

struct ScannerView: View {
    @ObservedObject private var viewModel = ScannerViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Text("Bluetooth Scanner")
                    .font(.system(size: 22).bold())
                HStack {
                    Spacer()
                    Image(systemName: "power")
                        .foregroundColor(viewModel.bleIsOn ? .green : .red)
                        .padding([.trailing])
                        .font(.system(size: 22))
                }
            }
            
            
            List {
                ForEach(viewModel.peripherals) { peripheral in
                    PeripheralView(peripheral: peripheral)
                        .padding(.bottom)
                }
            }
            
            HStack {
                Button {
                    viewModel.startScanning()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .frame(maxWidth: 150, maxHeight: 50)
                            .foregroundColor(.green)
                        Text("Start Scan")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                Button {
                    viewModel.stopScanning()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .frame(maxWidth: 150, maxHeight: 50)
                            .foregroundColor(.red)
                        Text("Stop Scan")
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }

        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
