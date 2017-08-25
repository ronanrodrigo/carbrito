import Foundation

struct ListBrandNetworkGateway: ListBrandGateway {

    private var url = "http://fipe-api.herokuapp.com/cars/brand"
    private let getRequest: GetRequestable

    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }

    func allBrands(_ completionHandler: @escaping CompletionHandler<[Brand], CarbritoError>) {
        getRequest.get(url: url) { data, error in
            if let data = data {
                let result = self.generateResult(data: data)
                completionHandler(result)
            } else if let error = error {
                completionHandler(Result.fail(error))
            } else {
                completionHandler(Result.fail(CarbritoError.other(nil)))
            }
        }
    }

    private func generateResult(data: Data) -> Result<[Brand], CarbritoError> {
        do {
            let brandsDecodable = try JSONDecoder().decode([BrandDecodableEntity].self, from: data)
            let brands = self.generateStruct(brandsDecodable: brandsDecodable)
            return Result.success(brands)
        } catch {
            return Result.fail(.cast)
        }
    }

    private func generateStruct(brandsDecodable: [BrandDecodableEntity]) -> [Brand] {
        return brandsDecodable.map({ Brand(name: $0.name) })
    }

}
