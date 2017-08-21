import UIKit

class ShowCarController: UIViewController {

    private var mainView: ShowCarView!

    init(brandCar: BrandCar) {
        super.init(nibName: nil, bundle: nil)
        mainView = ShowCarView(parentView: view)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: ShowCarController.self))
    }

}
