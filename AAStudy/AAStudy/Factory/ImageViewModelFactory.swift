import Foundation

final class ImageViewModelFactory {
    private let factory: ImageFactory
    
    init(factory: ImageFactory) {
        self.factory = factory
    }
    
    func make() -> any ImageViewModelProtocol {
        return ImageViewModel(factory: factory)
    }
}
