import UIKit

// 1) class

struct location {
    let lat : Double
    let lon : Double
}

class Press {
    static func crash(_ obj : Any) {
    }
}

class Car {
    
    let mark : String
    let model : String
    public var milage : Int
    static let steelType : Int = 25
    class var productionAmount : Int {
        return 100
    }
    
    private var owner = "friend"
    private(set) var guardian : String = "Sentinel"
    fileprivate var uid : String = UUID().uuidString
    
    var buyDate : Date = Date()
    var buyTimetamp : TimeInterval {
        set { buyDate = Date (timeIntervalSince1970: newValue)}
        get { return buyDate.timeIntervalSince1970}
    }
    
    init (mark : String, model : String, milage : Int = 0) {
        self.mark = mark
        self.model = model
        self.milage = milage
        //seper.init()
    }
    
    convenience init() {
        self.init(mark:"Bobik",model:"Tuzik")
    }
    
    deinit {
        Press.crash(self)
    }
    
    func drive (to : location) -> Bool {
        guard abs(to.lat)>0 && abs(to.lon)>0 else {
            return false
        }
        return true
    }
    
    static func search(model : String) -> Car {
        if model == "Tuzik" {
            return Car(mark : "Bobik Motors" , model:model)
        }
        return Car()
    }
    /*
    var buyDate : Date
    var buyTimestamp : TimeInterval {
        set { buyDate = Date(timeIntervalSince1970: newValue)}
        get {return buyDate.timeIntervalSince1970}
        }
    */
    var sellDate : Date = Date()
    var ownTime : TimeInterval {
        return sellDate.timeIntervalSince(buyDate)
    }
    
    // private(set) - внутри как public а вне дает доступ на чтение
    // file private - внутри файла с исходным кодом работае , как public , а для других как private .
    
}


let car = Car()
let loc = location(lat: 12, lon: 14)
//print (car)
let car1 = Car.search(model: "Tuzik")
print (car1.drive(to: loc))

car1.buyDate
car1.sellDate
car1.ownTime
car.milage+=1
