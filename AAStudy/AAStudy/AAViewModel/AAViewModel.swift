//
//  AAViewModel.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//

import Foundation

final class AAViewModel: ObservableObject {
    private let service = AAService()
    @Published private(set) var characters: [Character]? = []
    
    init() {
       // Task { try? await fetchData() }
    }
    
    func fetchData() async throws {
        let list = try? await service.fetchCharacters()
        
        await MainActor.run {
            characters = list
        }
        
        print("👻 DEBUG: characters ->\(characters?.count)")
    }
}
