import XCTest
@testable import LazyReminder

final class ReminderModelTests: XCTestCase {
    func testDefaults() {
        let reminder = Reminder(title: "Test")
        XCTAssertEqual(reminder.status, .inbox)
        XCTAssertEqual(reminder.priority, .normal)
    }
}
