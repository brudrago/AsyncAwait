//
//  Character.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//
import Foundation

struct Character: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
    
    enum CodingKeys: CodingKey {
        case id, name, status, species, image
    }
}
