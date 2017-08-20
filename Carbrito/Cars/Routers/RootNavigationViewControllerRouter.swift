import UIKit

struct RootNavigationViewControllerRouter: RootRouter {

    private let window: UIWindow
    private let rootViewController: CreateCarController
    private let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        rootViewController = CreateCarControllerFactory.make()
        navigationController = UINavigationController(rootViewController: rootViewController)
    }

    func root() {
        window.backgroundColor = .white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}
