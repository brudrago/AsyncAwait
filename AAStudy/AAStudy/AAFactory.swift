//
//  AAFactory.swift
//  AAStudy
//
//  Created by Bruna Drago on 19/05/25.
//

import Foundation
import SwiftUI

//protocol AAFactoryProtocol {
//    static func make() -> some View
//}//: AAFactoryProtocol

struct AAFactory {
   
   @ViewBuilder
   static func make() -> some View {
        let service = AAService()
        let fetchUseCase = FetchCharacterUseCase(service: service)
        let model = AAViewModel(service: fetchUseCase)
        let contentView = ContentView(viewModel: model)

        contentView
    }
}
