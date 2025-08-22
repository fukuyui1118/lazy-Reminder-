import Foundation

enum Category: String, CaseIterable, Codable {
    case work, personal, family, finance, health, errands, shopping, travel, other
}

enum Priority: String, CaseIterable, Codable {
    case low, normal, high
}

enum Kind: String, CaseIterable, Codable {
    case deadline, timeBlock, someday
}

enum Source: String, CaseIterable, Codable {
    case camera, quickAdd, share, `import`
}

enum Status: String, CaseIterable, Codable {
    case inbox, scheduled, done, archived
}
