class DetailCarFakeGateway: DetailCarGateway {

    func detail(byCode code: String, andYear year: String, _ completionHandler: (Result<[Car], CarError>) -> Void) {
        let cars = ["Fiat 147"].map({
            Car(name: $0, code: code, year: year, brand: "", price: 0, tax: 0)
        })
        completionHandler(Result<[Car], CarError>.success(cars))
    }

}
