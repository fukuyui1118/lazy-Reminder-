import Foundation

struct PriorityScorer {
    func score(for reminder: Reminder) -> Double {
        var score: Double = 0
        if let due = reminder.dueDate {
            let hours = min(72, max(0, due.timeIntervalSinceNow / 3600))
            score += (72 - hours) / 72 * 3
        }
        let text = reminder.title.lowercased()
        if text.contains("urgent") || text.contains("asap") {
            score += 2
        }
        if text.contains("not urgent") {
            score -= 2
        }
        if reminder.source == .camera {
            score += 1
        }
        return max(0, min(10, score))
    }

    func priority(for score: Double) -> Priority {
        switch score {
        case 0...3: return .low
        case 4...6: return .normal
        default: return .high
        }
    }
}
