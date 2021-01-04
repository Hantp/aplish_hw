//
//  ContactsView.swift
//  BluetoothSwiftUI
//
//  Created by Zepiao Han on 12/30/20.
//

import SwiftUI

struct ContactsView: View {
    @ObservedObject var viewModel = ContactsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.devices) { device in
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        Text(device.name)
                    }
                )
            }
        }
    }
}

//
//struct ContactsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactsView(name: Binding.constant("text"))
//    }
//}

