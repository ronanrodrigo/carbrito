protocol ListCarsByBrandPresenter {
    func present(cars: [Car])
    func present(error: CarError)
}
