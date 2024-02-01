import Quick
import Nimble
import UIKit

@testable import BitLiro

final class ExchangeListCoordinatorTests: QuickSpec {

    override class func spec() {

        var sut: ExchangeListCoordinator!

        var navigationControllerSpy: UINavigationControllerSpy!

        beforeEach {
            navigationControllerSpy = UINavigationControllerSpy()

            sut = ExchangeListCoordinator(navigationController: navigationControllerSpy)
        }

        describe("#start") {
            beforeEach {
                sut.start(with: .push)
            }

            it("shows controller of correct type") {
                expect(navigationControllerSpy.topViewController).to(beAKindOf(ExchangeListViewController.self))
            }

            context("#showDetail") {
                beforeEach {
                    let viewModel: ExchangeListViewModel? = Mirror.extract("viewModel",
                                                                           from: navigationControllerSpy.topViewController!)
                    viewModel?.didSelectItem.accept(.stub())
                }

                it("starts coordinator of correct type") {
                    let currentCoordinator: Coordinator? = Mirror.extract("currentCoordinator",
                                                                          from: sut!)
                    expect(currentCoordinator).to(beAKindOf(ExchangeDetailCoordinator.self))
                }

                it("shows controller of correct type") {
                    expect(navigationControllerSpy.pushViewControllerParameters.last).to(beAKindOf(ExchangeDetailViewController.self))
                }
            }
        }
    }
}
