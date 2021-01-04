//
//  Device.swift
//  BluetoothSwiftUI
//
//  Created by Zepiao Han on 12/30/20.
//

import Foundation
import CoreBluetooth

struct Device: Identifiable {
    let id: UUID
    var name: String
    var periphral: CBPeripheral
    var message = [String]()
    
    init(name: String, periphral: CBPeripheral) {
        self.name = name
        self.periphral = periphral
        self.id = periphral.identifier
    }
}

