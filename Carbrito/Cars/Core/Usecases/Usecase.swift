protocol Usecase {
    associatedtype Entity
    var presenter: GenericPresenter<Entity> { get }
    var completionHandler: CompletionHandler<[Entity], CarbritoError> { get }
}

extension Usecase {

    var completionHandler: CompletionHandler<[Entity], CarbritoError> {
        let completion: CompletionHandler<[Entity], CarbritoError> = { result in
            switch result {
            case .success(let entities): self.present(withEntities: entities)
            case .fail(let error): self.presenter.present(error: error)
            }
        }
        return completion
    }

    private func present(withEntities entities: [Entity]) {
        if entities.isEmpty {
            self.presenter.presentEmpty()
        } else {
            self.presenter.present(entities: entities)
        }
    }

}
