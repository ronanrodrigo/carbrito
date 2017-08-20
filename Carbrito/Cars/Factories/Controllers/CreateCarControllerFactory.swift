struct CreateCarControllerFactory {

    static func make() -> CreateCarController {
        return CreateCarController(createCarRouter: CreateCarViewControllerRouterFactory.make())
    }

}
