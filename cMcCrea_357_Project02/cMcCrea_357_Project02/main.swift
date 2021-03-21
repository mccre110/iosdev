//
//  main.swift
//  cMcCrea_357_Project02
//
//
import Foundation

var pDict: [String: String] = [:]

func per(a: Int, b: Int)-> Int
{
    let r = a % b
    return r >= 0 ? r : r+b
}
func serialize(ustring: String)->String{
    let shift = ustring.count
    let revString = String(ustring.reversed())
    var vstring = ""
    for letter in revString {
        vstring += String(translate(l: letter, trans: shift))
    }
    return vstring
}
func deserialize(ustring: String)->String{
    let shift = -ustring.count
    var vstring = ""
    for letter in ustring {
        vstring += String(translate(l: letter, trans: shift))
    }
    let revString = String(vstring.reversed())
    return revString
}
func translate(l: Character, trans: Int) -> Character{
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
func readIn()->[String:String]{
    do{
        let fileURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("data.jason")

        let data = try Data(contentsOf: fileURL)
        let dic = try JSONSerialization.jsonObject(with: data)
        return dic as! [String : String]
    } catch {
        print(error)
    }
    return [:]
}
func readOut(){
    do{
        let fileURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("data.jason")

        try JSONSerialization.data(withJSONObject: pDict).write(to: fileURL)
    } catch {
        print(error)
    }
}
func viewAll(){
    if pDict.isEmpty{
        print("Nothing to display")
    }
    for key in pDict.keys {
        print(key)
    }
}
func viewSingle(){
    //get input
    let key = Ask.AskQuestion(questionText: "Enter Name:", acceptableReplies: [])
    if let pass = pDict[key]{ //check exists
        // get phrase
        let uPhrase = Ask.AskQuestion(questionText: "Enter passphrase:", acceptableReplies: [])
        let passPhrase = deserialize(ustring: pass)
        if passPhrase.hasSuffix(uPhrase){ //check passphrase
            print(passPhrase.dropLast(uPhrase.count))
        }else{
            print("Incorrect Phrase")
        }
    }else {
        print("Password doesn't exist")
    }
}
func deleteSingle(){
    //get input
    let key = Ask.AskQuestion(questionText: "Enter Name:", acceptableReplies: [])
    if  pDict[key] != nil{ //check exists
        pDict[key] = nil
    } else {
        print("Password doesn't exist")
    }
}
func addSingle(){
    //get name
    let name = Ask.AskQuestion(questionText: "Enter Name:", acceptableReplies: [])
    //get pass
    let pass = Ask.AskQuestion(questionText: "Enter Password:", acceptableReplies: [])
    //get phrase
    let phrase = Ask.AskQuestion(questionText: "Enter Passphrase", acceptableReplies: [])
    var passPhrase = pass + phrase
    passPhrase = serialize(ustring: passPhrase)
    if pDict[name] == nil { //check duplicate key
        pDict[name] = passPhrase
    }else{
        print("Name already exists")
    }
}
class Program{
    var prompt = """
1: View all password names
2: View a single password
3: Delete a password
4: Add a password
5: Quit
"""
    var vReply = ["1","2","3","4","5"]
    init(){
        var keepRunning = true
        pDict = readIn()
        
        while keepRunning {
            print("A Simple Password Manger")
            let reply = Ask.AskQuestion(questionText: prompt, acceptableReplies: vReply)
            switch Int(reply) {
            case 1:
                viewAll()
            case 2:
                viewSingle()
            case 3:
                deleteSingle()
            case 4:
                addSingle()
            case 5:
                keepRunning = false
            default:
                continue
            }
        }
        readOut()
    }
}
class Ask{
    static func AskQuestion(questionText output: String,
                                acceptableReplies inputArr: [String],
                                caseSentive: Bool = false)->String{
        print(output)
        guard let response = readLine() else{
            print("Invalid Input")
            return AskQuestion(questionText: output, acceptableReplies: inputArr)
        }
        if (inputArr.contains(response) || inputArr.isEmpty){
            return response
        } else{
            print("Invalid Input")
            return AskQuestion(questionText: output, acceptableReplies: inputArr)
        }
    }
}
let p = Program()
