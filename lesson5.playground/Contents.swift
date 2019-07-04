import UIKit

struct Car {
    var model : String
    let mark : String
}

var new1=Car(model: "Tu", mark: "mt")

new1.model
// отличия . 1) место хранения
// 2) структкры не поддерживают наследование
// 3) отсутствие приведения типов
// 4) нельзя сделать downcasting (приведение к более частному типу)

new1.model = "tt"

