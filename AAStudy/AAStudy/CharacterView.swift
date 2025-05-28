//
//  CharacterView.swift
//  AAStudy
//
//  Created by Bruna Drago on 06/05/25.
//

import SwiftUI

protocol ImageViewModelProtocol: ObservableObject {
    func fetchImages(_ url: String) async throws -> Image?
}

final class ImageViewModel: ImageViewModelProtocol {

    private let factory: ImageFactory
    
    init(factory: ImageFactory) {
        self.factory = factory
    }
    
    func fetchImages(_ url: String) async throws -> Image? {
        let imageFetch = factory.make()
        let image = try? await imageFetch.fetch(url)
        return image
    }
}

struct CharacterView: View {
    let name: String
    let status: String
    let imageUrl: String?
    @State private var image: Image? = nil
    @State private var isLoading = false
    @State var imageViewModel: any ImageViewModelProtocol

    var body: some View {
        HStack(spacing: 8) {
            if let url = URL(string: imageUrl ?? "") {
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                        .onAppear {
                            Task {
                                isLoading = true
                                let image = try await imageViewModel.fetchImages(imageUrl ?? "")
                                await MainActor.run {
                                    self.image = image
                                    self.isLoading = false
                                }
                            }
                        }
                }
            } else {
               Circle()
                   .fill(Color.red)
                   .frame(width: 60, height: 60)
           }
            
            VStack(alignment: .leading ,spacing: 4) {
                Text(name)
                    .font(.headline)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                Text(status)
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 80)
    }
}
