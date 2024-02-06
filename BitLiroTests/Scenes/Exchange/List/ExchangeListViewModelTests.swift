import Quick
import Nimble
import RxSwift
import RxCocoa
import UIKit

@testable import BitLiro

final class ExchangeListViewModelTests: QuickSpec {

    class override func spec() {

        var sut: ExchangeListViewModel!

        var networkManagerMock: NetworkManagerMock!
        let disposeBag = DisposeBag()

        beforeEach {
            networkManagerMock = NetworkManagerMock()

            sut = ExchangeListViewModel(networkManager: networkManagerMock)
        }

        describe("#init") {
            it("sets sceneTitle with correct value") {
                expect(sut.sceneTitle.value) == "BitLiro Exchanges"
            }
        }

        describe("#loadData") {
            var isLoadingParameters: [Bool]!
            beforeEach {
                isLoadingParameters = [Bool]()
                sut.isLoading
                    .subscribe { value in
                        isLoadingParameters.append(value)
                    }
                    .disposed(by: disposeBag)
            }

            context("when result is failure") {
                beforeEach {
                    sut.loadData()
                }
                it("calls networkManager's request with correct parameter") {
                    expect(networkManagerMock.requestParameters.count) == 1
                    expect(networkManagerMock.requestParameters.first as? ExchangeListService) == .getExchangeList
                }
                it("updates isLoading property correctly") {
                    expect(isLoadingParameters) == [true, true, false]
                }
                it("updates model property correctly") {
                    expect(sut.model.value) == []
                }
                it("updates isError property correctly") {
                    expect(sut.isError.value) == true
                }
            }

            context("when result is success") {
                beforeEach {
                    networkManagerMock.stubResult = .success([Exchange.stub()])
                    sut.loadData()
                }
                it("calls networkManager's request with correct parameter") {
                    expect(networkManagerMock.requestParameters.count) == 1
                    expect(networkManagerMock.requestParameters.first as? ExchangeListService) == .getExchangeList
                }
                it("updates isLoading property correctly") {
                    expect(isLoadingParameters) == [true, true, false]
                }
                it("updates model property correctly") {
                    expect(sut.model.value) == [.stub()]
                }
                it("updates isError property correctly") {
                    expect(sut.isError.value) == false
                }
            }
        }
    }
}
