import Foundation

final class ImageFactory {
   
    func make() -> any FetchImageProtocol {
        let service = AAService()
        let cacheManager = AACacheManager()
        let fetchImage = FetchImageUseCase(
            service: service,
            cacheManager: cacheManager
        )
        return fetchImage
    }
}
