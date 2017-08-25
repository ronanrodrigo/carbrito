protocol DetailCarPresenter: EmptyPresenter {
    func present(cars: [Car])
    func present(error: CarbritoError)
}
