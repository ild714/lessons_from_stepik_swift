import UIKit


//lesson1
print ("Hello world")

// 1) var and let
let a = 10
var b = UIView()
b = UIView()

// 2) if , else
var a1 : Int = 20
var b1 : UIView = UIView()

if a == 10 {
    
} else if a == 20 {
    
}
else {
    
}

// 3) cicle
for i in 0..<10 {
}

for j in 0...10{
    
}

var iw = 0
while iw < 10 {
    iw += 1
}

var inc = 0
repeat {
    inc += 1
} while inc<10

// 4) for each (collection)

let arr = [1,2,3]
for element in arr {
    
}

// 5) exception

enum Errors : Error {
    case divisionByZero
}

func doSomething() throws {
    throw Errors.divisionByZero
}

do {
    try doSomething()
}
catch {
    print ("e:\(error)")
}
