//
//  CharacterView.swift
//  AAStudy
//
//  Created by Bruna Drago on 06/05/25.
//

import SwiftUI

struct CharacterView: View {
    let name: String
    let status: String
    
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(Color.red)
                .frame(width: 60, height: 60)
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

#Preview {
    CharacterView(name: "Ricky", status: "Alive")
}
