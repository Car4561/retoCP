//
//  Global.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 16.07.21.
//

import Foundation
import UIKit
import Material
import Alamofire

class Global: NSObject {
    
    static let primary = UIColor(red: 118/255, green: 196/255, blue: 213/255, alpha: 1.0);
    static let accent = UIColor(red: 118/255, green: 196/255, blue: 213/255, alpha: 1.0);
    static let pink = UIColor(red: 255/255, green: 202/255, blue: 227/255, alpha: 1.0);

    static let morado = UIColor(red: 97/255, green: 108/255, blue: 78/255, alpha: 1.0);
    static let yellow = UIColor(red: 253/255, green: 224/255, blue: 81/255, alpha: 1.0);
    static let orange = UIColor(red: 244/255, green: 159/255, blue: 101/255, alpha: 1.0);
    static let blueCineplanet = UIColor(red: 0/255, green: 44/255, blue: 97/255, alpha: 1.0);

    static let lightBlue = UIColor(red: 237/255, green: 244/255, blue: 252/255, alpha: 1.0);
    static let gray = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0);
    static let lightGray = UIColor(red: 178/255, green: 187/255, blue: 187/255, alpha: 1.0);
    static let facebook = UIColor(red: 64/255, green: 91/255, blue: 164/255, alpha: 1.0);
    static let whatsapp = UIColor(red: 122/255, green: 208/255, blue: 109/255, alpha: 1.0);

    static let white = UIColor.white;
    static let transparent = UIColor.clear;
    static let ora = UIColor(red: 249/255, green: 171/255, blue: 127/255, alpha: 1.0);
    
    static let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    static func homeController() -> NavigationController{
        let tabBarController = Global.storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! UITabBarController
        tabBarController.selectedIndex = 1
        let navigationController = NavigationController(rootViewController: tabBarController)
        
        return navigationController
    }
    static func generateRandomColor() -> UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
            
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            
        return randomColor
   }
    static func getHeadersForCulqui() -> HTTPHeaders{
          let headers: HTTPHeaders = [
              "Authorization": "Bearer " + "pk_test_z6QeFBJl7pxGdLDQ",
              "Content-Type": "application/json; charset=utf-8"
          ]
          return headers
          
      }
}
