class ListBrandFakeGateway: ListBrandGateway {

    func allBrands(_ completionHandler: (Result<[Brand], BrandError>) -> Void) {
        let result = Result<[Brand], BrandError>.success(["Fiat", "Volkswagen", "Chevrolet", "Ford"].map(Brand.init))
        return completionHandler(result)
    }

}
