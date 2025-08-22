import EventKit

struct EventKitSyncService {
    private let store = EKEventStore()

    func requestAccess() async throws {
        try await store.requestAccess(to: .event)
    }

    func sync(reminder: Reminder) throws {
        guard FeatureFlags.eventKitSync else { return }
        let event = EKEvent(eventStore: store)
        event.title = reminder.title
        event.startDate = reminder.startDate ?? reminder.dueDate
        event.endDate = reminder.endDate ?? reminder.dueDate
        event.calendar = store.defaultCalendarForNewEvents
        try store.save(event, span: .thisEvent)
    }
}

enum FeatureFlags {
    static var eventKitSync: Bool {
        ProcessInfo.processInfo.environment["EVENTKIT_SYNC"] == "1"
    }
}
