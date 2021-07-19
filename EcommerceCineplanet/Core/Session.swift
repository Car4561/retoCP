//
//  Session.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation
import UIKit
import SwiftyJSON
import Toast_Swift
import Alamofire

public class Session: NSObject {
    
       
    func login(user : User) {
        set(user.email, "email")
        set(user.familyName, "familyName")
        set(user.givenName, "givenName")
        set(user.name, "fullname")
       
    }
    func isLogged() -> Bool {
        if get("email") != ""{
            return true
        }
        return false
    }
    func isViewedAssistant() ->Bool {
        let isViewed : Bool = get("viewedAssistant")
        return isViewed
    }
    
    func isViewedTutorialPayment() ->Bool {
        let isViewed : Bool = get("viewedTutorialPayment")
        return isViewed
    }
    
    func exist() -> Bool {
        if UserDefaults.standard.object(forKey: "keyName") != nil {
            return true
        }
        return false
    }
    
    
    func clearSession() {
        let dictionary = UserDefaults.standard.dictionaryRepresentation()

        dictionary.keys.forEach
        {
            key in   UserDefaults.standard.removeObject(forKey: key)
        }

    }
    func getEmail() -> String {
        if(  UserDefaults.standard.string(forKey: "email") ?? "" == ""){
            return "any@gmail.com"
        }
        return UserDefaults.standard.string(forKey: "email")!
    }
    
    func getDocument() -> String {
        if(  UserDefaults.standard.string(forKey: "document") ?? "" == ""){
            return "12345678"
        }
        return UserDefaults.standard.string(forKey: "document")!
    }
    func get(_ key: String) -> String {
        return  UserDefaults.standard.string(forKey: key) ?? ""
    }
    
    func get(_ key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key) ?? 0
    }
    
    func get(_ key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key) ?? false
    }
    
    func set(_ value: String, _ key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func set(_ value: Int, _ key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func set(_ value: Bool, _ key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
 
    func delete(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func getFullName() -> String {
        let attributes = JSON(parseJSON: self.get("attributes"))
        let name = attributes["name"].string ?? ""
        let surname = attributes["surname"].string ?? ""
        return name + " " + surname
    }
   
}

