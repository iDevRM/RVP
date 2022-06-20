//
//  PeripheralView.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 6/16/22.
//

import SwiftUI

struct PeripheralView: View {
    var peripheral: Peripheral
    var body: some View {
        HStack {
            Text(peripheral.broadcastName)
            
            Spacer()
            
            HStack {
                Image(systemName: "wifi")
                Text("\(peripheral.rssi)")
            }
        }
        .padding(.top)
        .font(.system(size: 20))
    }
}

struct PeripheralView_Previews: PreviewProvider {
    static var previews: some View {
        PeripheralView(peripheral: Peripheral(id: 0, broadcastName: "Sony XM4", rssi: 98))
    }
}
