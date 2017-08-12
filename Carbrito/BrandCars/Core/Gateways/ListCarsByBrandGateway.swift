protocol ListCarsByBrandGateway {
    func brands(byBrandName brandName: String, _ completionHandler: CompletionHandler<[BrandCar], BrandCarError>)
}
