import Foundation

class GenerateResultHandler<DecodableEntity: Decodable, Entity> {

    private let structGenerator: ([DecodableEntity]) -> [Entity]

    init(_ structGenerator: @escaping ([DecodableEntity]) -> [Entity]) {
        self.structGenerator = structGenerator
    }

    func generate(data: Data?, error: CarbritoError?) -> Result<[Entity], CarbritoError> {
        if let data = data {
            do {
                let carsDecodable = try JSONDecoder().decode([DecodableEntity].self, from: data)
                let cars = self.structGenerator(carsDecodable)
                return Result.success(cars)
            } catch {
                return Result.fail(.cast)
            }
        } else if let error = error {
            return Result.fail(error)
        } else {
            return Result.fail(CarbritoError.other(nil))
        }
    }

}
