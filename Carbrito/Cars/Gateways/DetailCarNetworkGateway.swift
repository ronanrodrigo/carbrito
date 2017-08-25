import Foundation

struct DetailCarNetworkGateway: DetailCarGateway {

    private var url = "http://fipe-api.herokuapp.com/cars"
    private let getRequest: GetRequestable

    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }

    func detail(byCode code: String, andYear year: String,
                _ completionHandler: @escaping CompletionHandler<[Car], CarsError>) {
        getRequest.get(url: "\(url)/\(code)/\(year)") { data, error in
            if let data = data {
                let result = self.generateResult(data: data)
                completionHandler(result)
            } else if let error = error {
                completionHandler(Result.fail(error))
            } else {
                completionHandler(Result.fail(CarsError.other(nil)))
            }
        }
    }

    private func generateResult(data: Data) -> Result<[Car], CarsError> {
        do {
            let carsDecodable = try JSONDecoder().decode([CarDecodableEntity].self, from: data)
            let cars = self.generateStruct(carsDecodable: carsDecodable)
            return Result.success(cars)
        } catch {
            return Result.fail(.cast)
        }
    }

    private func generateStruct(carsDecodable: [CarDecodableEntity]) -> [Car] {
        return carsDecodable.map({ Car(name: $0.name, code: $0.code, year: $0.year, brand: $0.brand, price: $0.price,
                                       tax: $0.tax) })
    }

}
