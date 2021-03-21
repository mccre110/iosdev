//
//  Encrypt.swift
//  cMcCrea_357_Project03
//
//  Created by cpsc on 3/20/21.
//

import Foundation
struct Encrypt{
    static func serialize(ustring: String)->String{
        let shift = ustring.count
        let revString = String(ustring.reversed())
        var vstring = ""
        for letter in revString {
            vstring += String(translate(l: letter, trans: shift))
        }
        return vstring
    }
    static func deserialize(ustring: String)->String{
        let shift = -ustring.count
        var vstring = ""
        for letter in ustring {
            vstring += String(translate(l: letter, trans: shift))
        }
        let revString = String(vstring.reversed())
        return revString
    }
    static func translate(l: Character, trans: Int) -> Character{
        if let ascii = l.asciiValue{
            var outPutInt = Int(ascii)
            if ascii >= 97 && ascii <= 122 {
                let x = per(a:(Int((ascii))-97+trans), b: 26)
                outPutInt = x+97
            }
            else if ascii >= 65 && ascii <= 90{
                let x = per(a:(Int((ascii))-65+trans), b: 26)
                outPutInt = x+65
            }
            return Character(UnicodeScalar(outPutInt)!)
        }
        return Character("")
    }
    static func per(a: Int, b: Int)-> Int
    {
        let r = a % b
        return r >= 0 ? r : r+b
    }
}
