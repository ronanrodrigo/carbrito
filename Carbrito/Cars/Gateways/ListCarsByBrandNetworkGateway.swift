import Foundation

struct ListCarsByBrandNetworkGateway: ListCarsByBrandGateway {

    private var url = "http://fipe-api.herokuapp.com/cars/brand"
    private let getRequest: GetRequestable

    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }

    func brands(byBrandName brandName: String,
                _ completionHandler: @escaping CompletionHandler<[BrandCar], BrandCarError>) {
        getRequest.get(url: "\(url)/\(brandName)") { data, _, error in
            if let data = data {
                let result = self.generateResult(data: data)
                completionHandler(result)
            } else {
                completionHandler(Result.fail(.invalidRequest(error)))
            }
        }
    }

    private func generateResult(data: Data) -> Result<[BrandCar], BrandCarError> {
        do {
            let brandCarsDecodable = try JSONDecoder().decode([BrandCarDecodableEntity].self, from: data)
            let brandCars = self.generateStruct(brandCarsDecodable: brandCarsDecodable)
            return Result.success(brandCars)
        } catch {
            return Result.fail(.castFail)
        }
    }

    private func generateStruct(brandCarsDecodable: [BrandCarDecodableEntity]) -> [BrandCar] {
        return brandCarsDecodable.map({ BrandCar(name: $0.name, code: $0.code, year: $0.year) })
    }

}
