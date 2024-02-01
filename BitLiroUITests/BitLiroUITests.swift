import XCTest

final class BitLiroUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        let firstRow = app.tables.cells.firstMatch

        XCTAssert(firstRow.waitForExistence(timeout: 5))

        firstRow.tap()

        XCTAssert(app.staticTexts["Name"].waitForExistence(timeout: 2))

        app.navigationBars["Exchange Detail"].buttons.firstMatch.tap()

        firstRow.swipeDown()

        XCTAssert(app.tables.cells.firstMatch.waitForExistence(timeout: 2))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
