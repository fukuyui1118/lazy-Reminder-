import SwiftUI

struct SettingsView: View {
    @AppStorage("defaultDeadlineHour") private var defaultDeadlineHour: Int = 17

    var body: some View {
        NavigationStack {
            Form {
                Stepper(value: $defaultDeadlineHour, in: 0...23) {
                    Text("Default deadline hour: \(defaultDeadlineHour)")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
