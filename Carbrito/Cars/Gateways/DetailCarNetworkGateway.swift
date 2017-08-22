import Foundation

struct DetailCarNetworkGateway: DetailCarGateway {

    private var url = "http://fipe-api.herokuapp.com/cars"

    func detail(byCode code: String, andYear year: String,
                _ completionHandler: @escaping CompletionHandler<[Car], CarError>) {
        GetRequest.get(url: "\(url)/\(code)/\(year)") { data, _, error in
            if let data = data {
                let result = self.generateResult(data: data)
                completionHandler(result)
            } else {
                completionHandler(Result.fail(.invalidRequest(error)))
            }
        }
    }

    private func generateResult(data: Data) -> Result<[Car], CarError> {
        do {
            let carsDecodable = try JSONDecoder().decode([CarDecodableEntity].self, from: data)
            let cars = self.generateStruct(carsDecodable: carsDecodable)
            return Result.success(cars)
        } catch {
            return Result.fail(.castFail)
        }
    }

    private func generateStruct(carsDecodable: [CarDecodableEntity]) -> [Car] {
        return carsDecodable.map({ Car(name: $0.name, code: $0.code, year: $0.year, brand: $0.brand, price: $0.price,
                                       tax: $0.tax) })
    }

}
