import Foundation

extension Date {
    func at(hour: Int, minute: Int = 0) -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components) ?? self
    }
}
