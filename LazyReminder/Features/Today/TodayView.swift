import SwiftUI

struct TodayView: View {
    var body: some View {
        NavigationStack {
            Text("Today")
                .navigationTitle("Today")
        }
    }
}

#Preview {
    TodayView()
}
