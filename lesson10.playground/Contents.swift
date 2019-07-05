import UIKit

// 1) closures

let sayHello = {
    print ("Hi")
}

sayHello()

let greetings = { (_ p : String) -> Void in
    print ("Hi \(p)")
}

greetings("me")

let greetings1 : (String) -> Void = {
    name in print ("hi \(name)")
}

greetings1("f")

let rnd = {
    () -> String in
    return UUID().uuidString
}

rnd()

class Printer {
    func print (_ p : String) {
        print (p)
    }
}

let printer = Printer()
// сильная ссылка
let greetings3 = {
    printer.print("hello")
}

let greetings4 = { [printer] in
    printer.print("hello")
}

