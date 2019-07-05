import UIKit

enum Planets : Int {
    // с маленькой буквы
    case mercury = 1
    case venus
    case earth
    case mars
    case jupyter
    case saturn
    case neptune
    case uranus
    
    var isInnerPlanet : Bool {
        switch self {
        case .mercury , .jupyter , .mars : return true
        default : return false
            
        }
    }
    
    func distance (to planet:Planets) -> Double {
        return Double(arc4random())
    }
}

let p = Planets.mars
print (p.rawValue)

// хранимые значения
// либо сырое , либо хранимое
enum Result  {
    case sucess (data : Data , headers : [String:Any])
    case failure(error:Error)
    
    var rawValue : String {
        switch self {
        case .sucess : return "sucess"
        case .failure : return "failure"
        }
    }
}

let p1 = Result.sucess(data: Data(),headers: ["Ild":"today"])
print (p1)

print (p.isInnerPlanet)
print (p.distance(to:.earth))


let res1 : Result = .sucess(data: Data(), headers: [:])

print (res1.rawValue)
switch res1 {
case let .sucess(data, headers) : print (data , " ",headers)
case let .failure(error) : print (error)
}


