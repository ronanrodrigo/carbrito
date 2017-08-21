import UIKit

final class GenericDataProvider<Item>: NSObject, UITableViewDataSource, UITableViewDelegate {

    private var items: [Item]
    private var reuseIdentifiers: Set<String> = []
    private let cellDescriptor: (Item) -> CellDescriptor

    init(items: [Item], cellDescriptor: @escaping (Item) -> CellDescriptor) {
        self.items = items
        self.cellDescriptor = cellDescriptor
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let descriptor = cellDescriptor(item)
        register(identifier: descriptor.identifier, cellClass: descriptor.cellClass, tableView: tableView)

        let cell = tableView.dequeueReusableCell(withIdentifier: descriptor.identifier, for: indexPath)
        descriptor.configure(cell)

        return cell
    }

    func tableView(_ tableView: UITableView, updateItems items: [Item]) {
        self.items = items
        tableView.reloadData()
    }

    private func register(identifier: String, cellClass: UITableViewCell.Type, tableView: UITableView) {
        if !reuseIdentifiers.contains(identifier) {
            tableView.register(cellClass, forCellReuseIdentifier: identifier)
            reuseIdentifiers.insert(identifier)
        }
    }

}
