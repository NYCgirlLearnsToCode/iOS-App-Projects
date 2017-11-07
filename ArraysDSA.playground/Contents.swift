//: Playground - noun: a place where people can play

import UIKit

//Linked List
class Node<Key> { //Key is a type that we created
    var val: Key
    var next: Node?
    init(val:Key) {
        self.val = val
    }
}

let headNode = Node(val: 5)
let headNode2 = Node(val: "d")

let arr = Array(repeatElement(10, count: 1000))
func constantTime(arr: [Int]) {
    print("Hi")
}
//const time operation doesnt care if arr is empty or not, takes same amt of time
constantTime(arr: arr)
constantTime(arr: [])

var strArr = ["this", "is", "a", "test"]
//the below is not for coding, just to understand how code works
withUnsafePointer(to: &strArr){ (pointer: UnsafePointer<[String]>) in
    print(pointer)//memory address 0x000000011fc07df8, changes everytime code is run
    print(pointer.pointee)//prints what is there ["this", "is", "a", "test"]

}
//withUnsafePointer(to: &<#T##T#>, <#T##body: (UnsafePointer<T>) throws -> Result##(UnsafePointer<T>) throws -> Result#>)
//& is location,body is a closure
//tell me where to go and will do things there

MemoryLayout.size(ofValue: strArr)

var intArr = [1,5,2000000]

withUnsafePointer(to: &intArr){print($0, $0.pointee)}
MemoryLayout.size(ofValue: intArr[2])//Memory is the same no matter how many digits bc the space has already been allocated 8 bytes in each element(if 64bit int then 64bits in each element)


