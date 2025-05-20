//
//  AAService.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//

import Foundation

enum AAError: Error {
    case invalidResponse(statusCode: Int)
    case invalidURL
}

protocol AAServiceProtocol {
    func fetch(_ urlString: String) async throws -> Result<(Data, URLResponse), Error>
}

final class AAService: AAServiceProtocol {
    init() {}
    
    func fetch(_ urlString: String) async throws -> Result<(Data, URLResponse), Error> {
        guard let url = URL(string: urlString) else { return .failure(AAError.invalidURL) }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            
            guard statusCode == 200 else {
                throw AAError.invalidResponse(statusCode: statusCode ?? -1)
            }
            
            return .success((data, response))
           
        } catch let error {
            print("👻 DEBUG: error -> \(error.localizedDescription)")
            return .failure(error)
        }
    }
}
