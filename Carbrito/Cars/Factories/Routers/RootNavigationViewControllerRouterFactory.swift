import UIKit

// swiftlint:disable:next type_name
struct RootNavigationViewControllerRouterFactory {

    static func make(window: UIWindow) -> RootNavigationViewControllerRouter {
        return RootNavigationViewControllerRouter(window: window)
    }

}
