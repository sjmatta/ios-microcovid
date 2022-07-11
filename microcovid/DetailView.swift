import SwiftUI

struct DetailView: View {
    @Binding var event: CovidEvent
    
    @State private var data = CovidEvent.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return List {
            Section(header: Text("Event Info")) {
                HStack {
                    Label("Date", systemImage: "clock")
                    Spacer()
                    Text("\(dateFormatter.string(from: event.date))")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Microcovids", systemImage: "allergens")
                    Spacer()
                    Text("\(Int(event.microcovids))")
                }
                .accessibilityElement(children: .combine)
            }
            .toolbar {
                Button("Edit") {
                    isPresentingEditView = true
                    data = event.data
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationView {
                    DetailEditView(data: $data)
                        .navigationTitle(event.desc)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    event.update(from: data)
                                }
                            }
                        }
                }
                .navigationTitle(event.desc)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(event: .constant(CovidEvent.sampleData[0]))
        }
    }
}
