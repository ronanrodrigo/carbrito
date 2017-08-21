import UIKit

final class ChooseBrandView: UITableView {

    private lazy var dataProvider: GenericDataProvider<Brand> = {
        let dataProvider = GenericDataProvider<Brand>(items: []) { item -> CellDescriptor in
            return CellDescriptor(identifier: String(describing: UITableViewCell.self)) { (cell: UITableViewCell) in
                cell.textLabel?.text = item.name
            }
        }
        return dataProvider
    }()

    init(parentView: UIView) {
        super.init(frame: .zero, style: .plain)
        setupView(parentView: parentView)
        delegate = dataProvider
        dataSource = dataProvider
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Log.initCoder(from: CarFormView.self))
    }

    private func setupView(parentView: UIView) {
        backgroundColor = .divider
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        let safeArea = parentView.safeAreaLayoutGuide
        topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
    }

}

extension ChooseBrandView: ListBrandPresenter {

    func present(brands: [Brand]) {
        dataProvider.tableView(self, updateItems: brands)
    }

    func present(error: BrandError) {}
    func presentEmpty() {}

}
