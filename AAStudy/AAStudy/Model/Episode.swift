//
//  Episode.swift
//  AAStudy
//
//  Created by Bruna Drago on 07/05/25.
//

import Foundation

struct Episode: Codable {
    var id: Int
    var name: String
    var episode: String
    var characters: [String]
    var url: String
}
