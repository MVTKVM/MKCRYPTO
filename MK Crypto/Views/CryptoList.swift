//
//  CryptoList.swift
//  MK Crypto
//
//  Created by Mathieu Camélique on 18.05.21.
//

import SwiftUI
import SystemConfiguration

struct CryptoList: View {
    
    @State private var lesCryptos = [Crypto]()
    @State private var showAlert = false
    private let reachability = SCNetworkReachabilityCreateWithName(nil, "cameliquem.emf-informatique.ch")
    
    var body: some View {
        HStack {
            NavigationView {
                List {
                    ForEach(lesCryptos , id: \.name) { crypto in
                        CryptoRow(currentCrypto: crypto)
                    }
                }
                .navigationTitle("MK Crypto")
            }
        }
        // Call the function when the app is launched
        .onAppear {
            var flags = SCNetworkReachabilityFlags()
            SCNetworkReachabilityGetFlags(reachability!, &flags)
            if self.isNetworkReachable(with: flags) {
                getAllCryptos()
            } else {
                self.showAlert = true
            }
        }
        // Call the function when the app is displayed from the background
        .onReceive(NotificationCenter.default.publisher(for:
            //Event launched when the app is coming for the background
            UIApplication.willEnterForegroundNotification)) { _ in
            var flags = SCNetworkReachabilityFlags()
            SCNetworkReachabilityGetFlags(reachability!, &flags)
            if self.isNetworkReachable(with: flags) {
                getAllCryptos()
            } else {
                self.showAlert = true
            }        }
        
        .alert(isPresented: self.$showAlert, content: {
            Alert(title: Text("Informations indisponibles"),
                  message: Text("Veuillez vérifier votre connexion Internet et redémarrer l'application."),
                  dismissButton: .default(Text("OK")))
        })
    }
    
    func getAllCryptos () {
        lesCryptos.removeAll()
        Worker().getAllCryptosInfos() { cryptos in
            cryptos.cryptos!.forEach{crypto in
                self.lesCryptos.append(crypto)
            }
        }
    }
    
    func isNetworkReachable(with flags : SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        return  isReachable && (!needsConnection || canConnectWithoutInteraction)
    }
    
}
