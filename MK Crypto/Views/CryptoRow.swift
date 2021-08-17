//
//  CryptoRow.swift
//  MK Crypto
//
//  Created by Mathieu Camélique on 18.05.21.
//

import SwiftUI

struct CryptoRow: View {
    
    @State var showBottomView = false
    var currentCrypto: Crypto
    
    var body: some View {
        HStack() {
            Text(currentCrypto.name)
            Spacer()
            Text("\(currentCrypto.price)")
                .foregroundColor(currentCrypto.change24h > 0 ? .green : currentCrypto.change24h < 0 ? .red : .white)
            Button(action: {
                self.showBottomView.toggle()
            }) {
                Text("")
            }.sheet(isPresented: $showBottomView) {
                BottomView(showBottomView: $showBottomView, currentCrypto: currentCrypto)
            }
        }
    }
}
