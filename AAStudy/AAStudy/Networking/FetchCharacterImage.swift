//
//  FetchCharacterImage.swift
//  AAStudy
//
//  Created by Bruna Drago on 19/05/25.
//

import Foundation
import SwiftUI

protocol FetchImageProtocol {
    func fetch(_ urlString: String?) async throws -> Image?
}

final class FetchImageUseCase: FetchImageProtocol {
    private let service: AAServiceProtocol
    private let cacheManager: AACacheManagerProtocol
    
    init(
        service: any AAServiceProtocol,
        cacheManager: AACacheManagerProtocol
    ) {
       self.service = service
       self.cacheManager = cacheManager
   }
    
    func fetch(_ urlString: String?) async throws -> Image? {
        guard
            let urlString = urlString,
            let url = URL(string: urlString)
        else { return nil}
        
        guard !cacheManager.isDataAlreadyCached(url) else {
            let url = URL(string: urlString)
            let cachedImage = cacheManager.getCachedImage(url: url)
            return cachedImage
        }
        
        let result = try await service.fetch(urlString)
        
        switch result {
        case .success((let data, let response)):
            cacheManager.cacheData(with: response, data: data)
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
            }
        case let .failure(error):
            //TODO: HANDLE ERROR
            print("👻 DEBUG: error -> \(error.localizedDescription)")
            return nil
        }
        return nil
    }
}
