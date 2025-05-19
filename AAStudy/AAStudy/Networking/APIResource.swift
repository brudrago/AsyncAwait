//
//  API.swift
//  AAStudy
//
//  Created by Bruna Drago on 07/05/25.
//

import Foundation

enum AAResource: String {
    case character
    case episode
    case location
}

struct AAAPI {
    static let baseURL: String = "https://rickandmortyapi.com/api/"
}
