struct ListCarsByBrandUsecase {

    private let listCarsByBrandGateway: ListCarsByBrandGateway
    private let listCarsByBrandPresenter: GenericPresenter<BrandCar>

    init(listCarsByBrandGateway: ListCarsByBrandGateway, listCarsByBrandPresenter: GenericPresenter<BrandCar>) {
        self.listCarsByBrandGateway = listCarsByBrandGateway
        self.listCarsByBrandPresenter = listCarsByBrandPresenter
    }

    func list(byBrandName brandName: String) {
        listCarsByBrandGateway.brands(byBrandName: brandName, carsByBrandNameOnComplete())
    }

    private func carsByBrandNameOnComplete() -> CompletionHandler<[BrandCar], CarbritoError> {
        let carsByBrandCompletion: CompletionHandler<[BrandCar], CarbritoError> = { result in
            switch result {
            case .success(let brandCars): self.present(brandCars: brandCars)
            case .fail(let error): self.listCarsByBrandPresenter.present(error: error)
            }
        }
        return carsByBrandCompletion
    }

    private func present(brandCars: [BrandCar]) {
        if brandCars.isEmpty {
            self.listCarsByBrandPresenter.presentEmpty()
        } else {
            self.listCarsByBrandPresenter.present(entities: brandCars)
        }
    }
}
