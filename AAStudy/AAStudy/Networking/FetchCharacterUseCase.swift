//
//  FetchCharacterUseCase.swift
//  AAStudy
//
//  Created by Bruna Drago on 14/05/25.
//

import Foundation

protocol FetchCharacterUseCasing {
    func fetchCharacters() async throws -> [Character]?
}

final class FetchCharacterUseCase: FetchCharacterUseCasing {
    private let service: AAServiceProtocol
    
    init(service: any AAServiceProtocol) {
       self.service = service
   }
    
    func fetchCharacters() async throws -> [Character]? {
        let urlString = "https://rickandmortyapi.com/api/character"
        let result = try await service.fetch(urlString)
        
        switch result {
        case .success(let data):
            let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
            
            return characterResponse.results
        case .failure(let error):
            //TODO: HANDLE ERROR
            print("👻 DEBUG: error -> \(error.localizedDescription)")
            return nil
        }
    }
}
