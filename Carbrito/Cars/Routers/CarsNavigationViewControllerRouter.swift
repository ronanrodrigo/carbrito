import UIKit

class CarsNavigationViewControllerRouter: CarsRouter {

    private let window: UIWindow
    private weak var rootViewController: CreateCarController?
    private let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        rootViewController = CreateCarControllerFactory.make()
        navigationController = UINavigationController(rootViewController: rootViewController!)
    }

    func root() {
        rootViewController?.carsRouter = self
        window.backgroundColor = .white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func brandList() {
        let chooseBrandViewController = ChooseBrandController(carsRouter: self)
        navigationController.pushViewController(chooseBrandViewController, animated: true)
    }

    func carForm() {
        navigationController.popViewController(animated: true)
    }

}
