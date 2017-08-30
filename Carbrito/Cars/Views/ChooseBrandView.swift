import UIKit

final class ChooseBrandView: UITableView, CarbritoView {

    var emptyView: EmptyView!

    enum ActionName: String {
        case didSelectBrand
    }

    private let actions: [ActionName: ((Brand) -> Void)]

    private lazy var dataProvider: GenericDataProvider<Brand> = {
        let dataProvider = GenericDataProvider<Brand>(items: [], cellDescriptor: { item -> CellDescriptor in
            return CellDescriptor(identifier: String(describing: UITableViewCell.self)) { (cell: UITableViewCell) in
                cell.textLabel?.text = item.name
            }
        }, didSelectItem: { brand in
            self.execute(action: .didSelectBrand, brand: brand)
        })
        return dataProvider
    }()

    private(set) lazy var presenter: GenericPresenter<Brand> = GenericPresenterFactory<Brand>.make({ brands in
         self.dataProvider.tableView(self, updateItems: brands)
    }, presentError, presentEmpty)

    init(parentView: UIView, actions: [ActionName: ((Brand) -> Void)]) {
        self.actions = actions
        super.init(frame: .zero, style: .plain)
        setupView(parentView: parentView)
        delegate = dataProvider
        dataSource = dataProvider
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: CarFormView.self))
    }

    private func execute(action: ActionName, brand: Brand) {
        guard let actionCallback = actions[action] else { return Log.notLinked(action: action.rawValue) }
        actionCallback(brand)
    }

}
