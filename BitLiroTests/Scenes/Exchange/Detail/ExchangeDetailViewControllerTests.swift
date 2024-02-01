import Quick
import Nimble

@testable import BitLiro

final class ExchangeDetailViewControllerTests: QuickSpec {

    class override func spec() {

        var sut: ExchangeDetailViewController!

        var viewModelSpy: ExchangeDetailViewModelSpy!
        var contentView: ExchangeDetailView!

        beforeEach {
            viewModelSpy = ExchangeDetailViewModelSpy()
            contentView = ExchangeDetailView()

            sut = ExchangeDetailViewController(viewModel: viewModelSpy, contentView: contentView)
        }

        describe("#viewDidLoad") {
            beforeEach {
                sut.viewDidLoad()
            }

            context("#bindLayoutEvents") {

                context("when scene title is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.sceneTitle.accept("Test")
                    }
                    it("sets viewController's title correctly") {
                        expect(sut.title) == "Test"
                    }
                }

                context("when nameTitleLabel is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.nameTitleLabel.accept("Test")
                    }
                    it("updates contentView's nameTitleLabel correctly") {
                        expect(contentView.nameTitleLabel.text) == "Test"
                    }
                }

                context("when nameValueLabel is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.nameValueLabel.accept("Test")
                    }
                    it("updates contentView's nameValueLabel correctly") {
                        expect(contentView.nameValueLabel.text) == "Test"
                    }
                }

                context("when idTitleLabel is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.idTitleLabel.accept("Test")
                    }
                    it("updates contentView's idTitleLabel correctly") {
                        expect(contentView.idTitleLabel.text) == "Test"
                    }
                }

                context("when idValueLabel is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.idValueLabel.accept("Test")
                    }
                    it("updates contentView's idValueLabel correctly") {
                        expect(contentView.idValueLabel.text) == "Test"
                    }
                }

                context("when volumeTitleLabel is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.volumeTitleLabel.accept("Test")
                    }
                    it("updates contentView's volumeTitleLabel correctly") {
                        expect(contentView.volumeTitleLabel.text) == "Test"
                    }
                }

                context("when volumeValueLabel is updated on viewModel") {
                    beforeEach {
                        viewModelSpy.volumeValueLabel.accept("Test")
                    }
                    it("updates contentView's volumeValueLabel correctly") {
                        expect(contentView.volumeValueLabel.text) == "Test"
                    }
                }
            }
        }
    }
}
