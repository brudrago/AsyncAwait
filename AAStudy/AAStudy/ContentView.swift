//
//  ContentView.swift
//  AAStudy
//
//  Created by Bruna Drago on 04/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = AAViewModel()
    
    var body: some View {
        List {
            if viewModel.characters?.count ?? 0 > 0 {
                ForEach(viewModel.characters ?? []) { character in
                    CharacterView(name: character.name, status: character.status)
                }
            } else {
                CharacterView(name: "Ricky", status: "alive")
            }
            
        }.onAppear {
            Task {
                try? await viewModel.fetchData()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

