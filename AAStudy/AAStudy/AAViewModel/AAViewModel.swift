//
//  AAViewModel.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//

import Foundation

final class AAViewModel: ObservableObject {
    private let service = AAService()
    
    init() {
        Task { try? await fetchData() }
    }
    
    func fetchData() async throws {
        try? await service.fetchCharacters()
    }
}
