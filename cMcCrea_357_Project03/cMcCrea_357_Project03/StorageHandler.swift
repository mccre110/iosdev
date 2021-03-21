//
//  StorageHandler.swift
//  cMcCrea_357_Project03
//
//  Created by cpsc on 3/14/21.
//

import Foundation

struct StorageHandler {
    static var defaultStorage: UserDefaults = UserDefaults.standard
    static let defaultKey = "dic"
    static func setStorage(input: [String:String]){
        defaultStorage.set(input, forKey: "dic")
    }
    static func getStorage() -> [String:String]{
        if let storedWords = defaultStorage.value(forKey: "dic"){
            return storedWords as! [String : String]
        }
        else{
            return [:]
        }
    }
}
