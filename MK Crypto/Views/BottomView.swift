//
//  BottomView.swift
//  MK Crypto
//
//  Created by Mathieu Camélique on 07.06.21.
//

import SwiftUI

struct BottomView: View {
    
    @Binding var showBottomView: Bool
    
    var currentCrypto: Crypto
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text(currentCrypto.name)
                        .font(.system(size: 30))
                    Spacer()
                }
                .padding(20)
                HStack {
                    Text("Symbol")
                    Spacer()
                    Text(currentCrypto.symbol)
                }
                .padding()
                HStack {
                    Text("Price")
                    Spacer()
                    Text("\(currentCrypto.price)")
                        .foregroundColor(currentCrypto.change24h > 0 ? .green : currentCrypto.change24h < 0 ? .red : .white)
                }
                .padding()
                HStack {
                    Text("Market cap")
                    Spacer()
                    Text("\(currentCrypto.marketCap)")
                }
                .padding()
                HStack {
                    Text("Total supply")
                    Spacer()
                    Text("\(currentCrypto.totalSupply)")
                }
                .padding()
                HStack {
                    Text("Change in 24h")
                    Spacer()
                    Text("\(currentCrypto.change24h)%")
                        .foregroundColor(currentCrypto.change24h > 0 ? .green : currentCrypto.change24h < 0 ? .red : .white)
                }
                .padding()
            }
            .padding()
                .navigationBarTitle(Text(currentCrypto.name),displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showBottomView = false
                }) {
                    Text("Done").bold()
                })
        }
    }
}
