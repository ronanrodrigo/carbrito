protocol ListCarsByBrandPresenter: EmptyPresenter {
    func present(cars: [BrandCar])
    func present(error: BrandCarError)
}
