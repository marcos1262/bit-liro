import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }

    func start(with navigationType: NavigationType)
}

extension Coordinator {

    func show(_ viewController: UIViewController,
              with navigationType: NavigationType = .push,
              animated: Bool = true) {
        switch navigationType {
        case .root:
            navigationController.setViewControllers([viewController], animated: animated)
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
}
