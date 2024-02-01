import Quick
import Nimble
import UIKit

@testable import BitLiro

final class ExchangeDetailCoordinatorTests: QuickSpec {

    override class func spec() {

        var sut: ExchangeDetailCoordinator!

        var navigationController: UINavigationController!

        beforeEach {
            navigationController = UINavigationController()

            sut = ExchangeDetailCoordinator(navigationController: navigationController,
                                            model: .stub())
        }

        describe("#start") {
            beforeEach {
                sut.start(with: .push)
            }

            it("shows controller of correct type") {
                expect(navigationController.topViewController).to(beAKindOf(ExchangeDetailViewController.self))
            }
        }
    }
}
