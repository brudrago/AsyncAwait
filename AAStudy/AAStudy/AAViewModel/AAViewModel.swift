import Foundation
import SwiftUI

protocol AAViewModelProtocol: ObservableObject {
    func fetchData() async throws
    var characters: [Character]? { get }
    func makeImageViewModel() -> any ImageViewModelProtocol
}

final class AAViewModel: AAViewModelProtocol {
    
    @Published var characters: [Character]?
    
    private let service: FetchCharacterUseCasing
    private let factoryVM: ImageViewModelFactory
    
    init(
        service: any FetchCharacterUseCasing,
        factoryVM: ImageViewModelFactory
    ) {
        self.service = service
        self.factoryVM = factoryVM
    }
    
    func fetchData() async throws {
        let list = try? await service.fetchCharacters()
        
        await MainActor.run {
            characters = list
        }
        
        print("👻 DEBUG: characters ->\(characters?.count)")
    }
    
    func makeImageViewModel() -> any ImageViewModelProtocol {
        factoryVM.make()
    }
}


