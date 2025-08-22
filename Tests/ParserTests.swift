import XCTest
@testable import LazyReminder

final class ParserTests: XCTestCase {
    let parser = HeuristicParser()

    func testNotUrgentSomeday() {
        let reminder = parser.parse("reply to this not urgent")
        XCTAssertEqual(reminder.kind, .someday)
        XCTAssertEqual(reminder.priority, .low)
        XCTAssertLessThanOrEqual(reminder.confidence, 0.6)
    }

    func testDeadlineByWeekday() {
        let reminder = parser.parse("do this by Wednesday")
        XCTAssertEqual(reminder.kind, .deadline)
        XCTAssertNotNil(reminder.dueDate)
    }

    func testTimeBlockRange() {
        let reminder = parser.parse("do this 12-1 tomorrow")
        XCTAssertEqual(reminder.kind, .timeBlock)
        XCTAssertNotNil(reminder.startDate)
        XCTAssertNotNil(reminder.endDate)
    }

    func testOCRSample() {
        let reminder = parser.parse("Please respond by Friday")
        XCTAssertEqual(reminder.kind, .deadline)
        XCTAssertNotNil(reminder.dueDate)
    }
}
