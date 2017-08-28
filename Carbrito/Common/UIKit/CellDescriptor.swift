import UIKit

struct CellDescriptor {
    let cellClass: UITableViewCell.Type
    let identifier: String
    let configure: ((UITableViewCell) -> Void)

    init<Cell: UITableViewCell>(identifier: String, configure: @escaping (Cell) -> Void) {
        self.cellClass = Cell.self
        self.identifier = identifier
        self.configure = { cell in
            guard let cell = cell as? Cell else { return }
            configure(cell)
        }
    }
}
