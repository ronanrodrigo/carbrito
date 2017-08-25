protocol DetailCarGateway {
    func detail(byCode code: String, andYear year: String,
                _ completionHandler: @escaping CompletionHandler<[Car], CarbritoError>)
}
