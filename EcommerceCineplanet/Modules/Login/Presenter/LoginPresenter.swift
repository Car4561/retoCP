//
//  LoginPresenter.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation
import UIKit

protocol LoginViewProtocol: class {
    func showWelcomePopUp(user: User)
    func showWelcomePopUpInvited()
}

protocol LoginPresenterProtocol : BasePresenter {
    func saveUserLogged(user: User)
    func loggedInvited()
}

class LoginPresenter : LoginPresenterProtocol{
 
    let view : LoginViewProtocol?

    init(view: LoginViewProtocol) {
        self.view = view
    }
    
    func saveUserLogged(user: User) {
        getSession().login(user: user)
        view?.showWelcomePopUp(user: user)
    }
    
    func loggedInvited(){
        view?.showWelcomePopUpInvited()
    }

}
