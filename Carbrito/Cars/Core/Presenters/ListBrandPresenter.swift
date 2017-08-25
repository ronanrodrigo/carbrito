protocol ListBrandPresenter: EmptyPresenter {
    func present(brands: [Brand])
    func present(error: CarsError)
}
