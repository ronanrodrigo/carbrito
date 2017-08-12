struct ListCarsByBrandUsecase {

    private let listCarsByBrandGateway: ListCarsByBrandGateway
    private let listCarsByBrandPresenter: ListCarsByBrandPresenter

    init(listCarsByBrandGateway: ListCarsByBrandGateway, listCarsByBrandPresenter: ListCarsByBrandPresenter) {
        self.listCarsByBrandGateway = listCarsByBrandGateway
        self.listCarsByBrandPresenter = listCarsByBrandPresenter
    }

    func list(byBrandName brandName: String) {
        listCarsByBrandGateway.brands(byBrandName: brandName, carsByBrandNameOnComplete())
    }

    private func carsByBrandNameOnComplete() -> CompletionHandler<[BrandCar], BrandCarError> {
        let carsByBrandCompletion: CompletionHandler<[BrandCar], BrandCarError> = { result in
            switch result {
            case .success(let brandCars):
                if brandCars.isEmpty {
                    self.listCarsByBrandPresenter.presentEmpty()
                } else {
                    self.listCarsByBrandPresenter.present(brandCars: brandCars)
                }
            case .fail(let error): self.listCarsByBrandPresenter.present(error: error)
            }
        }
        return carsByBrandCompletion
    }

}
