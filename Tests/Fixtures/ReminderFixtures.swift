import Foundation
@testable import LazyReminder

struct ReminderFixtures {
    static func sample() -> Reminder {
        Reminder(title: "Sample", notes: "note")
    }
}
