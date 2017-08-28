struct DetailCarUsecase {

    private let detailCarGateway: DetailCarGateway
    private let detailCarPresenter: GenericPresenter<Car>

    init(detailCarGateway: DetailCarGateway, detailCarPresenter: GenericPresenter<Car>) {
        self.detailCarGateway = detailCarGateway
        self.detailCarPresenter = detailCarPresenter
    }

    func detail(byCode code: String, andYear year: String) {
        detailCarGateway.detail(byCode: code, andYear: year, detailCarOnComplete())
    }

    private func detailCarOnComplete() -> CompletionHandler<[Car], CarbritoError> {
        let carsByBrandCompletion: CompletionHandler<[Car], CarbritoError> = { result in
            switch result {
            case .success(let cars): self.present(cars: cars)
            case .fail(let error): self.detailCarPresenter.present(error: error)
            }
        }
        return carsByBrandCompletion
    }

    private func present(cars: [Car]) {
        if cars.isEmpty {
            self.detailCarPresenter.presentEmpty()
        } else {
            self.detailCarPresenter.present(entities: cars)
        }
    }
}
