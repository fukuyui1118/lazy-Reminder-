import Foundation

struct APIClient {
    let baseURL = URL(string: "https://example.com")!

    func extractReminder(from text: String) async throws -> Reminder {
        let url = baseURL.appendingPathComponent("extractReminder")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(["text": text])
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Reminder.self, from: data)
    }
}
