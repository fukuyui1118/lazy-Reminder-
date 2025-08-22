import UserNotifications

struct NotificationService {
    func schedule(reminder: Reminder) async throws {
        guard let due = reminder.dueDate else { return }
        let content = UNMutableNotificationContent()
        content.title = reminder.title
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: max(due.timeIntervalSinceNow, 1), repeats: false)
        let request = UNNotificationRequest(identifier: reminder.id.uuidString, content: content, trigger: trigger)
        try await UNUserNotificationCenter.current().add(request)
    }
}
