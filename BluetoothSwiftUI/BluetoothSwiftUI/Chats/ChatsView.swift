//
//  ChatsView.swift
//  BluetoothSwiftUI
//
//  Created by Zepiao Han on 12/30/20.
//

import SwiftUI

struct ChatsView: View {
    
    @ObservedObject var viewModel = ChatsViewModel()
    
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.messages, id: \.self) { message in
                        Text(message)
                    }
                }
            }
            
            HStack {
                TextField("", text: $viewModel.typingMessage)
                    .disableAutocorrection(true)
                
                Button(action: {
                    viewModel.sendMessageBtn()
                }, label: {
                    Text("Send")
                })
            }
        }
        .padding()
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
