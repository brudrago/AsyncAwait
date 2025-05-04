//
//  CharacterResponse.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//

import Foundation

struct CharacterResponse: Decodable {
    
    let info: CharacterInfo
    
    let results: [Character]
}

struct CharacterInfo: Decodable {
    
    let count: Int
    
    let pages: Int
    
    let next: String?
    
    let prev: String?
}
