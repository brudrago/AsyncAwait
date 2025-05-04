//
//  AAService.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//

import Foundation

final class AAService {
    
    func fetchCharacters() async throws  { //-> [Character]?
        let urlString = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: urlString) else { return  }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let characterList = try JSONDecoder().decode(CharacterResponse.self, from: data)
            print("👻 DEBUG: response ->\(response as? HTTPURLResponse)")
            print("👻 DEBUG: characterList -> \(characterList)")
           // return characterList
        } catch let error {
            print("👻 DEBUG: error -> \(error.localizedDescription)")
            //return nil
        }
    }
}
