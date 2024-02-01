import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        self.register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
}
