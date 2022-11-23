//
//  FOAAS.swift
//  FOAAS Networking
//
//  Created by Yaz Burrell on 11/23/22.
//

import Foundation

struct FOAAS: Decodable {
    var name: String
    var url: String
    var fields: [Fields]
}

struct Fields: Decodable {
    var name: String
    var field: String
}
