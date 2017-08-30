import UIKit

final class ChooseCarByBrandView: UITableView, CarbritoView {

    private let actions: [ChooseCarAction: ((BrandCar) -> Void)]
    var emptyView: EmptyView!

    private lazy var dataProvider: GenericDataProvider<BrandCar> = {
        let dataProvider = GenericDataProvider<BrandCar>(items: [], cellDescriptor: { item -> CellDescriptor in
            let setupCell: (SubtitleTableViewCell) -> Void = { cell in
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = "\(item.year) / \(item.code)"
            }
            return CellDescriptor(identifier: String(describing: SubtitleTableViewCell.self), configure: setupCell)
        }) { self.execute(action: .didSelectBrandCar, brandCar: $0) }
        return dataProvider
    }()

    private(set) lazy var presenter: GenericPresenter<BrandCar> = GenericPresenterFactory<BrandCar>.make({ brandCars in
        self.dataProvider.tableView(self, updateItems: brandCars)
    }, presentError, presentEmpty)

    init(parentView: UIView, actions: [ChooseCarAction: ((BrandCar) -> Void)]) {
        self.actions = actions
        super.init(frame: .zero, style: .plain)
        setupView(parentView: parentView)
        delegate = dataProvider
        dataSource = dataProvider
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: CarFormView.self))
    }

    private func execute(action: ChooseCarAction, brandCar: BrandCar) {
        guard let actionCallback = actions[action] else { return Log.notLinked(action: action.rawValue) }
        actionCallback(brandCar)
    }

}
