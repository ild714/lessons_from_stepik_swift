import UIKit

// generics - инструмент для написания обобщенного кода

func sum<T : Numeric> (a : T , b : T ) -> T {
    return a + b
}

print (sum(a: 1.2, b: 2))

protocol Packable {}

extension String : Packable {}



struct Pack<Obj : Packable> {
    
    var storage : [Obj] = []
    mutating func pack(obj:Obj){
        storage.append(obj)
    }
    
    mutating func upPack() -> Obj? {
        guard !storage.isEmpty else {
            return nil
        }
        return storage.remove(at: 0)
    }
}

var pack = Pack<String>()
pack.pack(obj: "dril")
pack.pack(obj: "bolt")
pack.pack(obj: "bolt")

pack.upPack()
pack.upPack()
pack.upPack()
pack.upPack()

protocol PackingContainer {
    associatedtype Element
    mutating func pack(_ obj:Element)
    mutating func unPack() -> Element?
}



struct IntPack: PackingContainer {

    typealias Element = Int

    mutating func pack(_ obj: Int) {
        
    }
    
    mutating func unPack() -> Int? {
        return nil
    }
}

struct DoublePack : PackingContainer{
    
    mutating func pack(_ obj : Double ){
        
    }
    
    mutating func unPack() ->Double? {
        return nil
    }
}
