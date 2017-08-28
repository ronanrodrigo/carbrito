class GenericPresenter<Entity> {

    private let onSuccess: ([Entity]) -> Void
    private let onError: (CarbritoError) -> Void
    private let onEmpty: () -> Void

    init(onSuccess: @escaping ([Entity]) -> Void, onError: @escaping (CarbritoError) -> Void,
         onEmpty: @escaping () -> Void) {
        self.onSuccess = onSuccess
        self.onError = onError
        self.onEmpty = onEmpty
    }

    func present(entities: [Entity]) {
        onSuccess(entities)
    }

    func present(error: CarbritoError) {
        onError(error)
    }

    func presentEmpty() {
        onEmpty()
    }

}
