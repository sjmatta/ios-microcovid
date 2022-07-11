import SwiftUI

@main
struct microcovidApp: App {
    @State private var events = CovidEvent.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CovidEventListView(events: $events)
            }
        }
    }
}
