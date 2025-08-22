import Foundation

struct HeuristicParser {
    func parse(_ text: String) -> Reminder {
        var reminder = Reminder(title: text)
        let lower = text.lowercased()
        if lower.contains("not urgent") {
            reminder.priority = .low
            reminder.kind = .someday
            reminder.confidence = 0.6
            return reminder
        }
        if let weekday = parseWeekday(from: lower) {
            let due = nextDate(for: weekday).at(hour: 17)
            reminder.kind = .deadline
            reminder.dueDate = due
            return reminder
        }
        if let range = parseTimeRange(from: lower) {
            reminder.kind = .timeBlock
            reminder.startDate = range.start
            reminder.endDate = range.end
            return reminder
        }
        reminder.kind = .someday
        return reminder
    }

    private func parseWeekday(from text: String) -> Int? {
        let weekdays = Calendar.current.weekdaySymbols.map { $0.lowercased() }
        for (index, name) in weekdays.enumerated() {
            if text.contains(name) {
                return index + 1
            }
        }
        return nil
    }

    private func nextDate(for weekday: Int) -> Date {
        let cal = Calendar.current
        let today = Date()
        let components = DateComponents(weekday: weekday)
        return cal.nextDate(after: today, matching: components, matchingPolicy: .nextTimePreservingSmallerComponents) ?? today
    }

    private func parseTimeRange(from text: String) -> (start: Date, end: Date)? {
        let pattern = "(\\d{1,2})[\\-–](\\d{1,2})"
        guard let match = text.range(of: pattern, options: .regularExpression) else { return nil }
        let parts = text[match].split(whereSeparator: { $0 == "-" || $0 == "–" })
        guard let startHour = Int(parts[0]), let endHour = Int(parts[1]) else { return nil }
        let cal = Calendar.current
        let start = cal.startOfDay(for: Date()).at(hour: startHour)
        let end = cal.startOfDay(for: Date()).at(hour: endHour)
        return (start, end)
    }
}
