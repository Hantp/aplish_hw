//
//  ContactsViewModel.swift
//  BluetoothSwiftUI
//
//  Created by Zepiao Han on 12/30/20.
//

import Foundation
import CoreBluetooth

class ContactsViewModel: NSObject, ObservableObject {
    @Published var currentName: String = UserManager.shared.mainUser.name
    @Published var devices = [Device]()
    
    // Bluetooth configures
    var centralManager: CBCentralManager?
    var peripheralManager: CBPeripheralManager?
    let UUID = Constants.serviceUUID
    
    override init() {
        super.init()
        setupBluetooth()
    }
    
    private func setupBluetooth() {
        centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    private func updateDeviceList(device: Device) {
        for i in 0..<devices.count {
            if devices[i].periphral.identifier == device.periphral.identifier {
                devices[i].name = device.name
//                tblView.reloadData()
                return
            }
        }
        
        devices.append(device)
//        tblView.reloadData()
    }
    
    private func updateAndAdvertiseThisDevice() {
        guard let pm = peripheralManager else {return}
        
        if pm.isAdvertising {
            pm.stopAdvertising()
        }
        
        let advertisingData: [String: Any] = [
            CBAdvertisementDataServiceUUIDsKey: [UUID],
            CBAdvertisementDataLocalNameKey: currentName
        ]
        
        pm.startAdvertising(advertisingData)
    }
}

// MARK: - Bluetooth configuration

extension ContactsViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
//            self.centralManager?.scanForPeripherals(withServices: [UUID], options: nil)
            self.centralManager?.scanForPeripherals(
                withServices: [UUID],
                options: [CBCentralManagerScanOptionAllowDuplicatesKey : true]
            )
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
       
        var peripheralName = "unknown"
        if let advertisementName = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = advertisementName
        }
        
        let newDevice = Device(name: peripheralName, periphral: peripheral)
        updateDeviceList(device: newDevice)
    }
}

extension ContactsViewModel: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            updateAndAdvertiseThisDevice()
        }
    }
    
}
