import UIKit

// 1) pattern matching (switch)

switch 1 {
case 1 : print ("1")
case 2: fallthrough
case 3: print ("3")
default : break
}

// 2) сопоставление кортежей

let a = true
let b = false

switch (a,b) {
case (false,false) : print ("0")
case (false,true) :print ("1")
case (true, false) : print ("2")
case (true,true) : print ("3")
}

let p: String? = "1"

switch p {
case _?:print ("Value")
case nil : print ("nil")
}

let p1: String? = nil

switch p1 {
case.none : print ("No Value")
case.some : print ("Value")
}

let val = (5,"example",3.14)

switch val {
case (_,_,let pi) : print ("pi is \(pi)")
}

switch (4,5){
case let (x,y): print ("We at \(x) \(y)")
}

let age = 12
let job: String? = "Worker"
let userInfo = NSDictionary()

switch (age,job,userInfo) {
case (let age , _?, _ as NSDictionary): print("h")
default : break
}

enum Entities {
    case soldier(x:Int,y:Int)
    case player(x:Int,y:Int)
    case tank(x:Int,y:Int)
}

let entities : [Entities] = [.soldier(x: 1, y: 2),.player(x: 2, y: 3)]

for e in entities {
    switch e {
    case let .soldier(x, y) : print ("s at \(x) \(y)")
    case let .player(x, y) : print ("s at \(x)\(y)")
    default : break
    }
}



// 3) downcasting

let a1 : Any = 5

switch a1 {
case is Int : print ("5")
case let n as Int : print ("a = \(n)")
default : break
}

// dz

let now = Date()

let ts = now.timeIntervalSince1970 // в число
let now1 = Date.init(timeIntervalSince1970: ts) // в дату

let fmt = DateFormatter() // форматирование
fmt.dateFormat = "yyyy-MM-dd" // для даты
let str = fmt.string(from: now1) // преобразование в строку
let now2 = fmt.date(from: str)

let nd =  Calendar.current.date(byAdding : .hour, value : 1 , to: now1)

let red = UIColor.red
let green = UIColor.green
let custom = UIColor(red:0.2,green:0.2,blue:0.5,alpha: 0.5)


var r  : CGFloat = 0
var g  : CGFloat = 0
var b1  : CGFloat = 0
var a2  : CGFloat = 0

custom.getRed(&r, green: &g, blue : &b1,alpha:&a2)



let jsx : [String:Any] = ["one":1,"two":1.2,"three":"3"]

do {
    let jsdata = try JSONSerialization.data(withJSONObject:jsx,options: [])
    let jsdict = try JSONSerialization.jsonObject(with: jsdata, options: [])
} catch {
    
}


let path = FileManager.default.urls(for .cachesDirectory, in .userDomainMask).first!
