import UIKit
import NetworkLayer

struct ExchangeDetailCoordinator {

    let navigationController: UINavigationController

    private let model: Exchange

    init(navigationController: UINavigationController, model: Exchange) {
        self.navigationController = navigationController
        self.model = model
    }
}

// MARK - Coordinator

extension ExchangeDetailCoordinator: Coordinator {

    func start(with navigationType: NavigationType) {
        let viewModel = ExchangeDetailViewModel(from: model)
        let controller = ExchangeDetailViewController(viewModel: viewModel)
        show(controller, with: navigationType)
    }
}
