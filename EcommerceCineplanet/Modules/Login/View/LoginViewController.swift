//
//  LoginViewController.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation
import UIKit
import GoogleSignIn


class LoginViewController: UIViewController,GIDSignInDelegate, LoginViewProtocol {
    
    var presenter : LoginPresenterProtocol!
    
    var configuration = LoginConfiguration()

    @IBOutlet var btnSignInGoogle : GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration.configure(view: self)
      
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard (user != nil) else {
            print("Error")
            return
        }

        print("user : \(user.profile.givenName) \(user.profile.familyName) \(user.profile.name)")
        let userLogged = User(email: user.profile.email, givenName: user.profile.givenName, familyName: user.profile.familyName, name: user.profile.name)
        presenter.saveUserLogged(user: userLogged )
    }
    
    @IBAction func loginInvited(_ sender: Any) {
        presenter.loggedInvited()
    }
    
    func showWelcomePopUp(user : User ){
        showAlertWelcome(title: "Bienvenido \(user.name)!!!", message: "Esperemos que disfrute de nuestras mejores películas",tabBar : tabBarController!)
    }
    
    func showWelcomePopUpInvited() {
        showAlertWelcome(title: "Bienvenido Invitado!!!", message: "Esperemos que se anime a registrarse para ver nuestras mejores películas",tabBar : tabBarController!)
    }

}
