import UIKit

// 1) procudure
func foo() {
    
}

// 2) func

func foo2() -> Int{
    return 2
}

func  say1 (p: String) {
    print (p)
}

say1(p: "hello")

func say2 (phrase p : String ) {
    print (p)
}

say2(phrase:  "One")

func say3 ( _ p : String ){
    print (p)
}

say3("hello")

func sum (a : Int , b : Int) {
    print (a + b)
}

sum (a: 1, b: 2)

// 3) default

func sum1 ( a : Int = 0, b : Int = 1)
{
    print (a + b)
}

sum1(a:3, b : 3)

// 4) guard, golden path

func two (a : Int ) -> String? {
    guard a == 2 else {
        return nil
    }
    return "two"
}

two(a: 3)

// 5) dangerous moment

/*
func handleTheDoor() {
    let door = Door()
    door.open()
    
    if !check1() {
        door.close()
        return
    }
    
    if !check2() {
        // ???
        return
    }
    
    door.handle()
    door.close()
}
*/

// if return , then the door close automatically . defer


class Door {
    func open() {
        
    }
    func close() {
        
    }
}

 enum DoorErrors : Error {
 case somethingBad
 }
 
func handleTheDoor(check1 : Bool, check2 : Bool) throws {
    let door = Door()
    door.open()
   
    defer { door.close()} // important!
    
    if !check1 {
        DoorErrors.somethingBad
        return
    }
    
    if !check2 {
        return
    }
    
}



