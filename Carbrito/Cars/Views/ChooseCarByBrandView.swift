import UIKit

final class ChooseCarByBrandView: CarBritoTableView {

    enum ActionName: String {
        case didSelectBrandCar
    }

    private let actions: [ActionName: ((BrandCar) -> Void)]

    private lazy var dataProvider: GenericDataProvider<BrandCar> = {
        let dataProvider = GenericDataProvider<BrandCar>(items: [], cellDescriptor: { item -> CellDescriptor in
            let setupCell: (SubtitleTableViewCell) -> Void = { cell in
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = "\(item.year) / \(item.code)"
            }
            return CellDescriptor(identifier: String(describing: SubtitleTableViewCell.self), configure: setupCell)
        }, didSelectItem: { brandCar in
            self.execute(action: .didSelectBrandCar, brandCar: brandCar)
        })
        return dataProvider
    }()

    private(set) lazy var presenter: GenericPresenter<BrandCar> = GenericPresenterFactory<BrandCar>.make({ brandCars in
        self.dataProvider.tableView(self, updateItems: brandCars)
    }, presentError, presentEmpty)

    init(parentView: UIView, actions: [ActionName: ((BrandCar) -> Void)]) {
        self.actions = actions
        super.init(frame: .zero, style: .plain)
        setupView(parentView: parentView)
        emptyView = EmptyView(parentView: parentView)
        delegate = dataProvider
        dataSource = dataProvider
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: CarFormView.self))
    }

    private func setupView(parentView: UIView) {
        backgroundColor = .white
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        let safeArea = parentView.safeAreaLayoutGuide
        topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
    }

    private func execute(action: ActionName, brandCar: BrandCar) {
        guard let actionCallback = actions[action] else { return Log.notLinked(action: action.rawValue) }
        actionCallback(brandCar)
    }

}
