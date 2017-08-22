import Foundation

struct ListBrandNetworkGateway: ListBrandGateway {

    private var url = "http://fipe-api.herokuapp.com/cars/brand"
    private let getRequest: GetRequestable

    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }

    func allBrands(_ completionHandler: @escaping CompletionHandler<[Brand], BrandError>) {
        getRequest.get(url: url) { data, _, error in
            if let data = data {
                let result = self.generateResult(data: data)
                completionHandler(result)
            } else {
                completionHandler(Result.fail(.invalidRequest(error)))
            }
        }
    }

    private func generateResult(data: Data) -> Result<[Brand], BrandError> {
        do {
            let brandsDecodable = try JSONDecoder().decode([BrandDecodableEntity].self, from: data)
            let brands = self.generateStruct(brandsDecodable: brandsDecodable)
            return Result.success(brands)
        } catch {
            return Result.fail(.castFail)
        }
    }

    private func generateStruct(brandsDecodable: [BrandDecodableEntity]) -> [Brand] {
        return brandsDecodable.map({ Brand(name: $0.name) })
    }

}
