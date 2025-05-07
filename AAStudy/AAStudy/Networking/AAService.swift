//
//  AAService.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//

import Foundation

enum AAError: Error {
    case invalidResponse(statusCode: Int)
}

final class AAService {
    
    func fetchCharacters() async throws -> [Character]? {
        let urlString = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: urlString) else { return [] }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            
            guard statusCode == 200 else {
                throw AAError.invalidResponse(statusCode: statusCode ?? -1)
            }
            
            let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
            
            return characterResponse.results
           
        } catch let error {
            print("👻 DEBUG: error -> \(error.localizedDescription)")
            return nil
        }
    }
}
