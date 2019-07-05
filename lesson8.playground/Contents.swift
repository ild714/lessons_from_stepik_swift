import UIKit

// 1) протокол предназначен для описания интерфейса или контракта некоторого объекта без деталей реализиции

protocol Vehicle {
    var isMoving : Bool {get}
    var name : String {get set}
    func move(to pos : CGPoint) -> Bool
}

class Car : Vehicle {
    var isMoving = true
    var name : String = "Tuzik"
    var position : CGPoint = .zero
    
    func move(to pos : CGPoint) -> Bool {
        self.position = pos
        return true
    }
}

// 2) generic protocol

protocol Soldier {
    associatedtype Weapon
    var weapon : Weapon {get}
}

// first way - называем тип или реализовываем контракт с его помощью кокого-либо конкретного типа
class Machinegun {}

class Trooper : Soldier {
    var weapon: Machinegun = Machinegun()
}

// second way . явно объявляем тип через typealias
class snipperRiffle {}

class Sniper : Soldier {
    typealias Weapon = snipperRiffle
    
    var weapon : snipperRiffle = snipperRiffle()
}

// 3) расширения позволяют добавить свои вычислимые поля и функции (не обязательно нашему)

extension String {
    func md5() -> String {
        return "nill"
    }
}

enum Planets {
    case mercury
}

private extension Planets {
    var diametr : Double {
        switch self {
        case .mercury : return 10
        }
    }
}

// 4) ограничения на generic с помощью протокола

protocol Packable {}

struct Pack<obj:Packable> {
    
}

extension String : Packable {}
