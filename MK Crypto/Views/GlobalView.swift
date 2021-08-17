//
//  ContentView.swift
//  MK Crypto
//
//  Created by Mathieu Camélique on 17.05.21.
//

import SwiftUI


struct GlobalView: View {
    var body: some View {
        HStack {
            CryptoList()
        }
        .ignoresSafeArea()
    }
}
