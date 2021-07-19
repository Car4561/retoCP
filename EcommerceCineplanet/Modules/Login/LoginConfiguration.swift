//
//  LoginConfiguration.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation
import GoogleSignIn

protocol LoginConfigurationProtocol {
    func configure(view: LoginViewController)
}

class LoginConfiguration: LoginConfigurationProtocol {
    
    func configure(view : LoginViewController) {
        view.presenter = LoginPresenter(view: view)
        GIDSignIn.sharedInstance()?.delegate = view
        GIDSignIn.sharedInstance().presentingViewController = view
    }
}
