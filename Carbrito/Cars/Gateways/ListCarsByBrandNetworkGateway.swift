import Foundation

struct ListCarsByBrandNetworkGateway: ListCarsByBrandGateway {

    private var url = "http://fipe-api.herokuapp.com/cars/brand"
    private let getRequest: GetRequestable

    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }

    func brands(byBrandName brandName: String,
                _ completionHandler: @escaping CompletionHandler<[BrandCar], CarbritoError>) {
        getRequest.get(url: "\(url)/\(brandName)") { data, error in
            let result = GenerateResult<BrandCarDecodableEntity, BrandCar>(self.mapBrandCar).generate(data, error)
            completionHandler(result)
        }
    }

    private func mapBrandCar(brandCarsDecodable: [BrandCarDecodableEntity]) -> [BrandCar] {
        return brandCarsDecodable.map({ BrandCar(name: $0.name, code: $0.code, year: $0.year) })
    }

}
