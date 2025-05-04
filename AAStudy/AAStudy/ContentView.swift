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
        ZStack {
            Color.teal.opacity(0.3)
                .ignoresSafeArea()
            
            Text("Hello, world!")
        }
    }
}

#Preview {
    ContentView()
}
