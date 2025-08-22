import XCTest
@testable import LazyReminder

final class PriorityScoringTests: XCTestCase {
    let scorer = PriorityScorer()

    func testPriorityLevels() {
        var reminder = Reminder(title: "urgent task")
        reminder.dueDate = Date().addingTimeInterval(3600)
        let score = scorer.score(for: reminder)
        XCTAssertGreaterThan(score, 7)
        XCTAssertEqual(scorer.priority(for: score), .high)
    }
}
