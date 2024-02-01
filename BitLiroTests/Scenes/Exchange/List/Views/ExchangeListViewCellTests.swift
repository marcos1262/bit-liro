import Quick
import Nimble
import Nimble_Snapshots
import CoreGraphics

@testable import BitLiro

final class ExchangeListViewCellTests: QuickSpec {

    override class func spec() {

        var sut: ExchangeListViewCell!

        beforeEach {
            sut = ExchangeListViewCell()
            sut.frame.size = CGSize(width: 300, height: 76)
        }

        describe("#show") {
            beforeEach {
                sut.show(.stub())
            }
            it("has valid snapshot") {
                expect(sut) == snapshot()
            }
        }
    }
}
