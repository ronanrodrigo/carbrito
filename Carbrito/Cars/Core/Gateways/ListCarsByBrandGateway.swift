protocol ListCarsByBrandGateway {
    func brands(byBrandName brandName: String,
                _ completionHandler: @escaping CompletionHandler<[BrandCar], BrandCarError>)
}
