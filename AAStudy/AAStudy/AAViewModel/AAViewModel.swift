//
//  AAViewModel.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//

import Foundation

protocol AAViewModelProtocol: ObservableObject {
    func fetchData() async throws
    var characters: [Character]? { get }
}

final class AAViewModel: AAViewModelProtocol {
    
    @Published var characters: [Character]?
    
    private let service: FetchCharacterUseCasing
    
    init(service: any FetchCharacterUseCasing) {
        self.service = service
    }
    
    func fetchData() async throws {
        let list = try? await service.fetchCharacters()
        
        await MainActor.run {
            characters = list
        }
        
        print("👻 DEBUG: characters ->\(characters?.count)")
    }
}
