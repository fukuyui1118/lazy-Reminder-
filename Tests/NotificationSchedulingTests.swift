import XCTest
import UserNotifications
@testable import LazyReminder

final class NotificationSchedulingTests: XCTestCase {
    func testScheduleCreatesRequest() async throws {
        var reminder = Reminder(title: "Ping")
        reminder.dueDate = Date().addingTimeInterval(5)
        let service = NotificationService()
        try await service.schedule(reminder: reminder)
        let requests = await UNUserNotificationCenter.current().pendingNotificationRequests()
        XCTAssertTrue(requests.contains { $0.identifier == reminder.id.uuidString })
    }
}
