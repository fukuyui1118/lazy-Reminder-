import Foundation

protocol LLMProvider {
    func extract(from text: String) async throws -> Reminder
}

struct DefaultLLMProvider: LLMProvider {
    let client = APIClient()
    func extract(from text: String) async throws -> Reminder {
        try await client.extractReminder(from: text)
    }
}
