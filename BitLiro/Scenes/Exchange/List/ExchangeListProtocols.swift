import UIKit
import RxSwift
import RxCocoa

protocol ExchangeListViewModelProtocol {
    var sceneTitle: BehaviorRelay<String> { get }
    var model: BehaviorRelay<[Exchange]> { get }
    var isLoading: BehaviorRelay<Bool> { get }
    var isError: BehaviorRelay<Bool> { get }
    var didSelectItem: PublishRelay<Exchange> { get }

    func loadData()
}

protocol ExchangeListViewProtocol: NSObject where Self: UIView {
    var tableView: UITableView { get }
    var errorView: ErrorViewProtocol { get }
    var isLoading: Binder<Bool> { get }
    var isError: Binder<Bool> { get }
}

protocol ExchangeListViewCellProtocol where Self: UITableViewCell {
    func show(_ model: Exchange)
}
