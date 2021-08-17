//
//  Crypto.swift
//  MK Crypto
//
//  Created by Mathieu Camélique on 18.05.21.
//

import Foundation
import UIKit

struct Crypto: Codable, Hashable {
    var name: String
    var symbol: String
    var price: Double
    var totalSupply: Double
    var marketCap: Double
    var change24h: Double
}
