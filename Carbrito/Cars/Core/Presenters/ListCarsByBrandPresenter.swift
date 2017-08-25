protocol ListCarsByBrandPresenter: EmptyPresenter {
    func present(brandCars: [BrandCar])
    func present(error: CarsError)
}
