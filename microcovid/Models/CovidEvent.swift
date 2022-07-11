import Foundation

struct CovidEvent: Identifiable {
    var id: UUID
    
    var desc: String
    var date: Date
    var microcovids: Double
    
    init(id: UUID = UUID(), desc:String, date: Date, microcovids: Double) {
        self.id = id
        self.desc = desc
        self.date = date
        self.microcovids = microcovids
    }
}


extension CovidEvent {
    
    static let sampleData: [CovidEvent] = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return [
            CovidEvent(desc: "Dinner", date: dateFormatter.date(from: "2022-07-08")!, microcovids: 93),
            CovidEvent(desc: "Shopping", date: dateFormatter.date(from: "2022-07-09")!, microcovids: 250)
        ]
    }()
    
    struct Data {
        var desc: String = ""
        var date: Date = Date.now
        var microcovids: Double = 0
    }
    
    var data: Data {
        Data(desc: desc, date: date, microcovids: microcovids)
    }
    
    mutating func update(from data: Data) {
        self.desc = data.desc
        self.date = data.date
        self.microcovids = data.microcovids
    }
}
