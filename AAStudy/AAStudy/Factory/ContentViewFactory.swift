import Foundation
import SwiftUI

struct ContentViewFactory {
   
   @ViewBuilder
    static func make() -> some View {
        let service = AAService()
        let fetchUseCase = FetchCharacterUseCase(service: service)
        let cacheManager = AACacheManager()
        let imageFactory = ImageFactory()
        let factoryVM = ImageViewModelFactory(factory: imageFactory)
        let model = AAViewModel(service: fetchUseCase, factoryVM: factoryVM)
        let contentView = ContentView(viewModel: model)
        
        contentView
    }
}
