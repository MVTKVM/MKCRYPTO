//
//  Wrk.swift
//  MK Crypto
//
//  Created by Mathieu Camélique on 25.05.21.
//

import Foundation
import UIKit

class Worker {
    
    // API's URL to get the information about cryptos
    let urlString = "https://cameliquem.emf-informatique.ch/A30/main.php?action=getAllCryptosInfos"
    
    func getAllCryptosInfos(completionHandler: @escaping (Cryptos) -> ()) {
        
        var cryptos = Cryptos(cryptos: nil)
        let url = URL(string: urlString)
        let session = URLSession.shared
       
        // Call to the API
        let dataTask = session.dataTask(with: url!) {(data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    // Decode all cryptos given by the API
                    cryptos = try decoder.decode(Cryptos.self, from: data!)
                }
                catch {
                    print("Impossible de convertir les données reçues")
                }
                completionHandler(cryptos)
            }
        }
        dataTask.resume()
    }
}
