class ListCarsByBrandFakeGateway: ListCarsByBrandGateway {

    func brands(byBrandName brandName: String, _ completionHandler: (Result<[BrandCar], BrandCarError>) -> Void) {
        let brandCars = ["Fiat 147", "Fiat Uno", "Palio", "Punto"].map({ BrandCar(name: $0, code: "", year: "") })
        let result = Result<[BrandCar], BrandCarError>.success(brandCars)
        return completionHandler(result)
    }

}
