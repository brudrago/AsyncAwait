//
//  ContentView.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//

import SwiftUI

struct ContentView<ViewModel: AAViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        List {
            if let characters = viewModel.characters, characters.count > 0 {
                ForEach(viewModel.characters ?? [Character]()) { character in

                    CharacterView(
                        name: character.name,
                        status: character.status,
                        imageUrl: character.image,
                        imageViewModel: viewModel.makeImageViewModel()
                    )
                }
            }
             else {
                 CharacterView(name: "Ricky", status: "alive", imageUrl: "", imageViewModel: viewModel.makeImageViewModel())
            }
            
        }.onAppear {
            Task {
                try? await viewModel.fetchData()
            }
            
        }
    }
}

