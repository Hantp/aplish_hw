//
//  ContentView.swift
//  BluetoothSwiftUI
//
//  Created by Zepiao Han on 12/30/20.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                TextField("Show me your name", text: $viewModel.name)
                    .disableAutocorrection(true)
                
                Spacer()
                
                NavigationLink(
                    destination: ContactsView(),
                    label: {Text("save and next")}
                )
                .font(.title)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                
                Spacer()
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
