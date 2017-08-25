protocol ListBrandGateway {
    func allBrands(_ completionHandler: @escaping CompletionHandler<[Brand], CarbritoError>)
}
