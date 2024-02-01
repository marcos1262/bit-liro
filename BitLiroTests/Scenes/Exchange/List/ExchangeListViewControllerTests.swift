import Quick
import Nimble
import RxSwift
import UIKit

@testable import BitLiro

final class ExchangeListViewControllerTests: QuickSpec {

    class override func spec() {

        var sut: ExchangeListViewController!

        var viewModelSpy: ExchangeListViewModelSpy!
        var contentView: ExchangeListView!
        let disposeBag = DisposeBag()

        beforeEach {
            viewModelSpy = ExchangeListViewModelSpy()
            contentView = ExchangeListView()

            sut = ExchangeListViewController(viewModel: viewModelSpy, contentView: contentView)
        }

        describe("#viewDidLoad") {
            beforeEach {
                sut.viewDidLoad()
            }

            it("calls viewModel's loadData method") {
                expect(viewModelSpy.loadDataCallCount) == 1
            }

            context("#bindLayoutEvents") {

                context("when model is selected on contentView's tableView") {
                    var selectedItem: Exchange?
                    beforeEach {
                        viewModelSpy.didSelectItem.subscribe { model in
                            selectedItem = model
                        }.disposed(by: disposeBag)
                        contentView.tableView.delegate?.tableView?(contentView.tableView,
                                                                   didSelectRowAt: IndexPath(row: 0, section: 0))
                    }
                    it("calls viewModel's didSelectItem event with correct value") {
                        expect(selectedItem) == .stub()
                    }
                }

                context("when refreshControl is activated on contentView's tableView") {
                    beforeEach {
                        contentView.tableView.refreshControl?.sendActions(for: .valueChanged)
                    }
                    it("calls viewModel's loadData method") {
                        expect(viewModelSpy.loadDataCallCount) == 2
                    }
                }

                context("when retryButton is tapped on contentView's errorView") {
                    beforeEach {
                        contentView.errorView.retryButton.sendActions(for: .touchUpInside)
                    }
                    it("calls viewModel's loadData method") {
                        expect(viewModelSpy.loadDataCallCount) == 2
                    }
                }

                context("when scene title is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.sceneTitle.accept("Test")
                    }
                    it("sets viewController's title correctly") {
                        expect(sut.title) == "Test"
                    }
                }

                context("when isLoading is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.isLoading.accept(true)
                    }
                    it("sets uiActivityIndicator's isAnimating correctly") {
                        let uiActivityIndicator: UIActivityIndicatorView? = Mirror.extract("uiActivityIndicator", from: contentView)
                        expect(uiActivityIndicator?.isAnimating) == true
                    }
                }

                context("when isError is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.isError.accept(true)
                    }
                    it("shows errorView") {
                        expect(contentView.errorView.isHidden) == false
                    }
                }

                context("when model is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.model.accept([.stub(name: "Test")])
                    }
                    it("updates contentView's tableView correctly") {
                        let cell = contentView.tableView.dataSource?.tableView(contentView.tableView, 
                                                                               cellForRowAt: IndexPath(row: 0, section: 0))
                        let nameLabel: UILabel? = Mirror.extract("nameLabel", from: cell!)
                        expect(nameLabel?.text) == "Test"
                    }
                }
            }
        }
    }
}
