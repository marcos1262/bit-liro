import Quick
import Nimble
import NetworkLayer
import Foundation

@testable import BitLiro

final class ExchangeListServiceTests: QuickSpec {

    class override func spec() {

        var sut: ExchangeListService!

        beforeEach {
            sut = .getExchangeList
        }

        describe("#init") {
            it("has baseURL with correct value") {
                expect(sut.baseURL) == URL(string: "https://rest.coinapi.io/v1")!
            }
            it("has path with correct value") {
                expect(sut.path) == "/exchanges"
            }
            it("has method with correct value") {
                expect(sut.method) == .get
            }
            it("has task with correct value") {
                guard case .requestPlain = sut.task else {
                    fail("task property must have correct value")
                    return
                }
            }
            it("has headers with correct value") {
                expect(sut.headers) == ["X-CoinAPI-Key": "B2B0CB4B-93AA-4C1D-868D-4B4B19533CFA"]
            }
        }
    }
}
