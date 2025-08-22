import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            InboxView()
                .tabItem { Label("Inbox", systemImage: "tray") }
            TodayView()
                .tabItem { Label("Today", systemImage: "calendar") }
            CalendarView()
                .tabItem { Label("Calendar", systemImage: "calendar.circle") }
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }
}

#Preview {
    ContentView()
}
