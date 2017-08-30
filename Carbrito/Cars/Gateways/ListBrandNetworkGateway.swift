import Foundation

struct ListBrandNetworkGateway: ListBrandGateway {

    private var url = "http://fipe-api.herokuapp.com/cars/brand"
    private let getRequest: GetRequestable

    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }

    func allBrands(_ completionHandler: @escaping CompletionHandler<[Brand], CarbritoError>) {
        getRequest.get(url: url) { data, error in
            let result = GenerateResultHandler<BrandDecodableEntity, Brand>(self.generateStruct).generate(data: data,
                                                                                                          error: error)
            completionHandler(result)
        }
    }

    private func generateStruct(brandsDecodable: [BrandDecodableEntity]) -> [Brand] {
        return brandsDecodable.map({ Brand(name: $0.name) })
    }

}
