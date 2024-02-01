import Quick
import Nimble
import Nimble_Snapshots

@testable import BitLiro

final class ExchangeDetailViewTests: QuickSpec {

    override class func spec() {

        var sut: ExchangeDetailView!

        beforeEach {
            sut = ExchangeDetailView()
            sut.frame.size = .iPhoneSE

            sut.nameTitleLabel.text = LocalizedStrings.nameTitle
            sut.nameValueLabel.text = "Exchange Name"
            sut.idTitleLabel.text = LocalizedStrings.idTitle
            sut.idValueLabel.text = "ID123"
            sut.volumeTitleLabel.text = LocalizedStrings.volumeTitle
            sut.volumeValueLabel.text = "123456789.45"
        }

        describe("#init") {
            it("has valid snapshot") {
                expect(sut) == snapshot()
            }
        }
    }
}
