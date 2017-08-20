import UIKit

final class CreateCarController: UIViewController {

    private var mainView: CarFormView!
    private var createCarRouter: CreateCarRouter!

    init(createCarRouter: CreateCarRouter) {
        super.init(nibName: nil, bundle: nil)
        self.createCarRouter = createCarRouter
        title = String.Carbrito.title
        mainView = CarFormView(parentView: view, actions: [.selectBrand: selectBrand])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: CreateCarController.self))
    }

    private func selectBrand() {
        createCarRouter.selectBrand()
    }

}
