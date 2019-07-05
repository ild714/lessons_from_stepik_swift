import UIKit

let arr1 = [1,2,3]
let arr2 = [Int]()
let arr3 = Array<Int>()
let arr4 : [Int] = []
let arr5 : [Int] = [1,2,3]

print (arr1[1])
var arr6 = Array<Int>()
arr6.append(15)
arr6.insert(1,at:1)
arr6.remove(at: 0)
arr6.removeAll()

for element in arr1 {
    
}

for (index,element) in arr1.enumerated(){
    
}

let dict = [1: "One",2: "two"]
let dict1 = [Int:String]()
let dict2 = Dictionary<Int, String>()
let dict3 : [Int:String] = [:]
print (dict3[1])

var di = [Int:String]()
di[1] = "st"
di[1] = nil

for (key,value) in dict {
    
}
