protocol DetailCarGateway {
    func detail(byCode code: String, andYear year: String, _ completionHandler: CompletionHandler<[Car], CarError>)
}
