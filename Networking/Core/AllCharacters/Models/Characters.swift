//
//  Characters.swift
//  Networking
//
//  Created by Ron Lane on 4/22/24.
//

import Foundation

struct Characters: Codable {
    var results : [Character]
}

struct Character: Codable, Identifiable {
    var id   : Int
    var name : String
}
