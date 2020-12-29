 //
//  ContentView.swift
//  SlotsDemo
//
//  Created by Zepiao Han on 12/27/20.
//

import SwiftUI

struct ContentView: View {
    @State private var credit = 1000
    @State private var symbols = ["BlueApple", "star", "cherry"]
    @State private var numbers = [1,2,0]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    private let bet = 10
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                Text("Credits: \(self.credit)")
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.5))
                    .padding(.all, 10)
                    .cornerRadius(20)
                
                Spacer()
                
                VStack {
                    HStack {
                        CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])

                        CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])

                        CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    }
                    
                    HStack {
                        CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        
                        CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                        
                        CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    }
                    
                    HStack {
                        CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        
                        CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                        
                        CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                    self.backgrounds = self.backgrounds.map { _ in Color.white }
                    
                    self.credit += 10
                    self.numbers = self.numbers.map({ _ in
                        Int.random(in: 0..<self.numbers.count)
                    })
                    
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        self.credit += self.bet * 10
                        
                        self.backgrounds = self.backgrounds.map { _ in Color.green }
                    } else {
                        self.credit -= self.bet
                    }
                    
                }, label: {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink.opacity(0.5))
                        .cornerRadius(15)
                })
                
                Spacer()
            }.padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
