import UIKit

@main
final class SceneDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var rootCoordinator: Coordinator?

    private func setupController() -> UIViewController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true

        rootCoordinator = ExchangeListCoordinator(navigationController: navigationController)
        rootCoordinator?.start(with: .root)

        return navigationController
    }
}

// MARK: - UIWindowSceneDelegate

extension SceneDelegate: UIWindowSceneDelegate {

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.tintColor = .systemOrange
        window?.rootViewController = setupController()
        window?.makeKeyAndVisible()
    }
}
