//
//  RegisterViewModel.swift
//  BluetoothSwiftUI
//
//  Created by Zepiao Han on 12/30/20.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name: String = UserManager.shared.mainUser.name {
        didSet {
            UserManager.shared.upsert(UserProfile(name: name))
        }
    }
}
