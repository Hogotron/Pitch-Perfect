//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var names: String = ""

func shortNameFromName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let rangeOfFirstChar = lowercaseName.rangeOfCharacter(from: vowelSet, options: [], range: lowercaseName.startIndex..<lowercaseName.endIndex)
    let newName = lowercaseName.subscript(rangeOfFirstChar!)
    
    return newName
}

shortNameFromName(name: "Tomas")
