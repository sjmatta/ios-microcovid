import SwiftUI

struct DetailEditView: View {
    @Binding var data: CovidEvent.Data
    
    var body: some View {
        Form {
            Section(header: Text("Event Info")) {
                DatePicker("Date", selection: $data.date, displayedComponents: .date)
                TextField("Description", text: $data.desc)
                HStack {
                    Slider(value: $data.microcovids, in: 0...5000, step: 100) {
                        Text("Microcovids")
                    }
                    Spacer()
                    Text("\(Int(data.microcovids)) microcovids")
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(CovidEvent.sampleData[0].data))
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
