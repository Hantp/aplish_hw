//
//  CharsViewModel.swift
//  BluetoothSwiftUI
//
//  Created by Zepiao Han on 12/30/20.
//

import Foundation
import CoreBluetooth

class ChatsViewModel: NSObject, ObservableObject {

    @Published var messages = [String]()
    @Published var typingMessage: String = ""
    var peripheralManager: CBPeripheralManager?
    var centralManager: CBCentralManager?
    
    var deviceUUID: UUID?
    var selectedDevice: CBPeripheral?
    
    override init() {
        super.init()
        setupBlueTooth()
    }
    
    private func setupBlueTooth() {
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
    }
    
    func sendMessageBtn() {
        if typingMessage != "" {
            centralManager?.connect(selectedDevice!, options: nil)
//            messageTextField.resignFirstResponder()
        }
    }
    
    private func updateAndAdvertiseMessage() {
        guard let pm = peripheralManager else {return}
        if pm.isAdvertising {
            pm.stopAdvertising()
        }
        
        pm.startAdvertising([
            CBAdvertisementDataServiceUUIDsKey: [Constants.serviceUUID],
            CBAdvertisementDataLocalNameKey: UserManager.shared.mainUser.name
        ])
    }
    
    private func appendMessageToChat(message: String) {
        messages.append(message)
    }
}

// MARK: - Bluetooth configuration

extension ChatsViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(
                withServices: [Constants.serviceUUID],
                options: [CBCentralManagerScanOptionAllowDuplicatesKey : true]
            )
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if peripheral.identifier == deviceUUID {
            central.stopScan()
            selectedDevice = peripheral
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }
}

extension ChatsViewModel: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            let service = CBMutableService(type: Constants.serviceUUID, primary: true)
            let rx = CBMutableCharacteristic(type: Constants.RXUUID, properties: .write, value: nil, permissions: .writeable)
            service.characteristics = [rx]
            peripheral.add(service)
            updateAndAdvertiseMessage()
        }
    }
    
    // Receive data from another device
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        for request in requests {
            if let value = request.value, let messageText = String(data: value, encoding: .utf8) {
                appendMessageToChat(message: messageText)
            }
            peripheralManager?.respond(to: request, withResult: .success)
        }
    }
}

extension ChatsViewModel: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let pServices = peripheral.services {
            for service in pServices {
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }
    
    // Send data to another device
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let sCharacteristics = service.characteristics else {return}
        for characteristics in sCharacteristics {
            if characteristics.uuid.isEqual(Constants.RXUUID) {
                if let data = typingMessage.data(using: .utf8) {
                    peripheral.writeValue(data, for: characteristics, type: .withResponse)
                    appendMessageToChat(message: typingMessage)
                    typingMessage = ""
                }
            }
        }
        
    }
}
