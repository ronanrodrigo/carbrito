import UIKit

final class ChooseBrandView: UITableView, CarbritoView {

    private let actions: [ChooseBrandAction: ((Brand) -> Void)]
    var emptyView: EmptyView!

    private lazy var dataProvider: GenericDataProvider<Brand> = {
        let dataProvider = GenericDataProvider<Brand>(items: [], cellDescriptor: { item -> CellDescriptor in
            return CellDescriptor(identifier: String(describing: UITableViewCell.self)) { (cell: UITableViewCell) in
                cell.textLabel?.text = item.name
            }
        }) { self.execute(action: .didSelectBrand, brand: $0) }
        return dataProvider
    }()

    private(set) lazy var presenter: GenericPresenter<Brand> = GenericPresenterFactory<Brand>.make({ brands in
         self.dataProvider.tableView(self, updateItems: brands)
    }, presentError, presentEmpty)

    init(parentView: UIView, actions: [ChooseBrandAction: ((Brand) -> Void)]) {
        self.actions = actions
        super.init(frame: .zero, style: .plain)
        setupView(parentView: parentView)
        delegate = dataProvider
        dataSource = dataProvider
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: CarFormView.self))
    }

    private func execute(action: ChooseBrandAction, brand: Brand) {
        guard let actionCallback = actions[action] else { return Log.notLinked(action: action.rawValue) }
        actionCallback(brand)
    }

}
