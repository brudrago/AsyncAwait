//
//  AAURLBuilder.swift
//  AAStudy
//
//  Created by Bruna Drago on 07/05/25.
//

import Foundation

final class AAURLBuilder {
    
    private var url: String
    
    init() {
        self.url = "\(AAAPI.baseURL)"
    }
    
    // MARK: - Public Functions
    
    func set(resource: AAResource) -> AAURLBuilder {
        self.url += "/users/\(resource)"
        return self
    }
    
    func set(page: Int) -> AAURLBuilder {
        self.url += "?page=\(page)"
        return self
    }
    
    func build() -> String {
        return url
    }
    
}
