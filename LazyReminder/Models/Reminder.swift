import Foundation
import CoreData

struct Reminder: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var notes: String?
    var category: Category = .other
    var priority: Priority = .normal
    var kind: Kind = .someday
    var dueDate: Date?
    var startDate: Date?
    var endDate: Date?
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
    var source: Source = .quickAdd
    var attachments: [Attachment] = []
    var status: Status = .inbox
    var confidence: Double = 1.0
    var tags: [String]? = nil
}

struct Attachment: Identifiable, Codable {
    var id: UUID = UUID()
    var type: String
    var localURL: URL
    var ocrText: String?
    var thumbnailLocalURL: URL?
}
