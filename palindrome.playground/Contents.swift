//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var str2 = "Madam"
var phrasepalin = "A man, a plan, a cat, a canal: Panama"
var raceCar = "race.car1 1"
phrasepalin.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil)


//palindrome - word reversed is the same
//ex anna == anna
//does case matter like is A == a?
//should I ignore punctuation?
//reversed
func isPalin(str: String) -> Bool {
    //should I ignore punctuation?
    let strCopy = str.lowercased().replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "\\d", with: "", options: .regularExpression, range: nil)
    // \\d is 0-9
    //   \W regex non alphanumberic chars like punctuation
    print(strCopy)
    let strCopyRev = String(strCopy.reversed())
    //reversed
    print(strCopyRev)
    return strCopyRev == strCopy
}
//isPalin(str: raceCar )

//Anagram - 2 words with same letters
func isAnagram(str1: String, str2: String) -> Bool {
    //lowercased
    let strCopy = str1.lowercased().sorted()
    print("strCopy", strCopy)
    let strCopy2 = str2.lowercased().sorted()
    print("strCopy2", strCopy2)
    //sort
    return strCopy == strCopy2
}
//isAnagram(str1: "cinema", str2: "iceman")
//isAnagram(str1: "anna", str2: "annas")

//palindrome is same word fwds and backwards
//ex anna == anna
//does case matter?
//is there punctuation in the str?
//reverse the word
func palindrome(str: String) -> Bool {
    let strCopy = str.lowercased().replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil)
    let strCopyReversed = String(str.lowercased().replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil).reversed())
    return strCopy == strCopyReversed
}
//palindrome(str: "anna")

//anagram 2 words contains the same letters
//input : str
//output: bool

//is A == a ?
//punctuation
//sort it
//compare

func anagram(str1: String, str2: String) -> Bool{
    let str1Copy = String(str1.lowercased().replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil).sorted())
    print(str1Copy)
    let str2Copy = String(str2.lowercased().replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil).sorted())
    print(str2Copy)
    
    return str1Copy == str2Copy
    
}

//java -> a
//does case matter?
//is there punctuation?
//print dupe chars
//for loop through str
//if more than 1 letter print

func dupes(str: String) -> [Character] {
    var strArr = Array(str)
    var letterDict = [Character: Int]()
    var dupes = [Character]()
    for letter in strArr {
        if letterDict[letter] != nil {
            letterDict[letter] = 1
            print(letter)
        } else {
            letterDict[letter] = 2
            print("dupe", letter)
        }
    }
//    for (num,num) in letterDict {
//        if num != 1 {
//            dupes.append(letter)
//        }
//    }
    return dupes
}
var dict = [String:Int]()
dict["a"] = 1
var dict2 = [String:Int]()
dict2["a"] = 1
dict == dict2
//dupes(str: "java")










