import Quick
import Nimble
import Nimble_Snapshots

@testable import BitLiro

final class ErrorViewTests: QuickSpec {

    override class func spec() {

        var sut: ErrorView!

        beforeEach {
            sut = ErrorView()
            sut.frame.size = .iPhoneSE
        }

        describe("#init") {
            it("has valid snapshot") {
                expect(sut) == snapshot()
            }
        }
    }
}
