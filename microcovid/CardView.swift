import SwiftUI

struct CardView: View {
    let event: CovidEvent
    
    var body: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return VStack(alignment: .leading) {
            Text("\(event.desc) @ \(dateFormatter.string(from: event.date))")
            HStack {
                Label("\(Int(event.microcovids)) microcovids", systemImage: "allergens")
            }
        }.padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var event = CovidEvent.sampleData[0]
    static var previews: some View {
        CardView(event: event)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
