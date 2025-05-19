//
//  Location.swift
//  AAStudy
//
//  Created by Bruna Drago on 07/05/25.
//

import Foundation

struct Location: Codable {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
}
