protocol ListCarsByBrandPresenter {
    func present(cars: [BrandCar])
    func present(error: BrandCarError)
}
