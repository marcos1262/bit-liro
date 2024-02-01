import UIKit
import NetworkLayer
import RxSwift

final class ExchangeListCoordinator {

    let navigationController: UINavigationController

    private let disposeBag = DisposeBag()
    private var currentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    private func showDetail(_ model: Exchange) {
        currentCoordinator = ExchangeDetailCoordinator(navigationController: navigationController,
                                                       model: model)
        currentCoordinator?.start(with: .push)
    }
}

// MARK - Coordinator

extension ExchangeListCoordinator: Coordinator {

    func start(with navigationType: NavigationType) {
        let viewModel = ExchangeListViewModel(networkManager: NetworkManager())
        viewModel.didSelectItem.subscribe { [weak self] model in
            self?.showDetail(model)
        }.disposed(by: disposeBag)
        let controller = ExchangeListViewController(viewModel: viewModel)
        show(controller, with: navigationType)
    }
}
