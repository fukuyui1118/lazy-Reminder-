import SwiftUI

struct ReviewSheet: View {
    @State var reminder: Reminder
    var onSave: (Reminder) -> Void

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $reminder.title)
            }
            .navigationTitle("Review")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Looks good") {
                        onSave(reminder)
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewSheet(reminder: Reminder(title: "Sample")) { _ in }
}
