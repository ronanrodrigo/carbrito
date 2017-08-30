import Foundation

struct ListBrandNetworkGateway: ListBrandGateway {

    private var url = "http://fipe-api.herokuapp.com/cars/brand"
    private let getRequest: GetRequestable

    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }

    func allBrands(_ completionHandler: @escaping CompletionHandler<[Brand], CarbritoError>) {
        getRequest.get(url: url) { data, error in
            let result = GenerateResult<BrandDecodableEntity, Brand>(self.mapBrand).generate(data, error)
            completionHandler(result)
        }
    }

    private func mapBrand(brandsDecodable: [BrandDecodableEntity]) -> [Brand] {
        return brandsDecodable.map({ Brand(name: $0.name) })
    }

}
