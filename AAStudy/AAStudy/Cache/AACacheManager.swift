//
//  AACacheManager.swift
//  AAStudy
//
//  Created by Bruna Drago on 19/05/25.
//

import SwiftUI

protocol AACacheManagerProtocol {
    func cacheData(with response: URLResponse, data: Data, url: URL?)
    func isDataAlreadyCached(_ url: URL) -> Bool
    func getCachedImage(url: URL?) -> Image?
}

final class AACacheManager: AACacheManagerProtocol {
 
    init() {}
    
    func cacheData(with response: URLResponse, data: Data, url: URL?) {
        guard let receivedURL = url else { return }
        
        cacheData(with: response, data: data, url: receivedURL)
    }
    
    func getCachedImage(url: URL?) -> Image? {
        guard let receivedURL = url else { return nil }
        
        let request = URLRequest(url: receivedURL)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request),
           let cachedImage = UIImage(data: cachedResponse.data) {
            return Image(uiImage: cachedImage)
        }
        return nil
    }
    
    func isDataAlreadyCached(_ url: URL) -> Bool {
        let request = URLRequest(url: url)
        
        guard let _ = URLCache.shared.cachedResponse(for: request) else { return false }
        
        return true
    }
    
    //MARK: - Private Methods
    
    private func cacheData(with response: URLResponse, data: Data, url: URL) {
        let request = URLRequest(url: url)
        let cachedData = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedData, for: request)
    }
}
