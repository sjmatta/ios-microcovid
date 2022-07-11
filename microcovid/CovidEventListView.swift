//
//  ContentView.swift
//  microcovid
//
//  Created by Stephen Matta on 7/11/22.
//

import SwiftUI

struct CovidEventListView: View {
    @Binding var events: [CovidEvent]
    
    var body: some View {
        List {
            ForEach($events) { $event in
                NavigationLink(destination: DetailView(event: $event)) {
                    CardView(event: event)
                }
                .navigationTitle("Events")
                .toolbar {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New Event")
                }
            }
        }
    }
}

struct CovidEventListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CovidEventListView(events: .constant(CovidEvent.sampleData))
        }
    }
}
