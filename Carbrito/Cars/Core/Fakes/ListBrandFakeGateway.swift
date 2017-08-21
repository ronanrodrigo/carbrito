class ListBrandFakeGateway: ListBrandGateway {

    func allBrands(_ completionHandler: (Result<[Brand], BrandError>) -> Void) {
        let brands = ["Fiat", "Volkswagen", "Chevrolet", "Ford"].map(Brand.init)
        let result = Result<[Brand], BrandError>.success(brands)
        return completionHandler(result)
    }

}
