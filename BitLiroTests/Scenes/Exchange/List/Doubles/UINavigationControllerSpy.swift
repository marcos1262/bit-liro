import UIKit

final class UINavigationControllerSpy: UINavigationController {

    private(set) var pushViewControllerParameters = [UIViewController]()

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushViewControllerParameters.append(viewController)
    }
}
