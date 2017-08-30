struct GenericPresenterFactory<T> {

    static func make(_ onSuccess: @escaping ([T]) -> Void, _ onError: @escaping (CarbritoError) -> Void,
                     _ onEmpty: @escaping () -> Void) -> GenericPresenter<T> {
        return GenericPresenter<T>(onSuccess: onSuccess, onError: onError, onEmpty: onEmpty)
    }

}
