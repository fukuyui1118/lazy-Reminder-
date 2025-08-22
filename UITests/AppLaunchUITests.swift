import XCTest

final class AppLaunchUITests: XCTestCase {
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.tabBars.buttons["Inbox"].exists)
    }
}
