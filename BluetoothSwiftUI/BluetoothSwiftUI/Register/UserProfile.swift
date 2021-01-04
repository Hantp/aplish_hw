//
//  UserProfile.swift
//  BluetoothSwiftUI
//
//  Created by Zepiao Han on 12/30/20.
//

import Foundation

struct UserProfile {
    var name: String
}

class UserManager {
    static let shared = UserManager()
    private let key = "MainUser"
    
    var mainUser: UserProfile {
        get {
            var chatUser = UserProfile(name: "")
            if let dict = UserDefaults.standard.dictionary(forKey: key) {
                chatUser.name = dict["name"] as? String ?? ""
            }
            return chatUser
        }
    }
    
    private init() {
    }
    
    func upsert(_ chatUser: UserProfile) {
        let dict = [
            "name": chatUser.name
        ]
        UserDefaults.standard.set(dict, forKey: key)
    }
}
