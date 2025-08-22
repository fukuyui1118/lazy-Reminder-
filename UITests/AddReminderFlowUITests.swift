import XCTest

final class AddReminderFlowUITests: XCTestCase {
    func testAddReminderFlow() throws {
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Inbox"].tap()
        XCTAssertTrue(app.navigationBars["Inbox"].exists)
    }
}
