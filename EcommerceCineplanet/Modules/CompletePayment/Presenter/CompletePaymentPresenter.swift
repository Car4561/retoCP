//
//  CompletePaymentPresenter.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

protocol CompletePaymentViewProtocol : class {
    func showToastError(error: String)
    func showLoadingPopUp()
    func hideLoadingPopUp()
    func hideLoadingView()
    func exitViewController()
}

protocol CompletePaymenPresenterProtocol : BasePresenter {
    func makePayment(culqiTokenRequest: CulqiTokenRequest, verify: Bool)

}

class CompletePaymentPresenter: CompletePaymenPresenterProtocol {
  
    
  
    let view : CompletePaymentViewProtocol?
    
    init(view: CompletePaymentViewProtocol) {
        self.view = view
    }
    
    func makePayment(culqiTokenRequest: CulqiTokenRequest,verify : Bool) {
        if verify {
            print(culqiTokenRequest.cardNumber!)
            print("CULQI: cardNumber:\(culqiTokenRequest.cardNumber), expirationMonth:\(culqiTokenRequest.expirationMonth), expirationYear: \(culqiTokenRequest.expirationYear), email : \(culqiTokenRequest.email)")
            getRestClient().postCulqiToken(culqiToken: culqiTokenRequest, successHandler: { response in
                self.setCompleteRequest(tokenCard: response)
                print("Token de Culqi para transacciones : \(response.id)")
            }, failHandler: { error in
                print(error)
                self.view?.showToastError(error: "Tarjeta de crédito incorrecta")
                self.view?.exitViewController()
            })
        }else{
            self.setCompleteRequestNotVerify()

        }
       
    }
    
    func setCompleteRequest(tokenCard : TokenCard)  {
        let complete = Complete()
        complete.name = tokenCard.id
        complete.mail = tokenCard.email
        complete.dni = getSession().get("document")
        complete.operationDate = String(tokenCard.creationDate)
        getRestClient().postComplete(complete: complete, successHandler: {response in
            if response.resulCode == "0"{
                print("RESULT CODE : \(response.resulCode)")
                self.view?.hideLoadingView()
            }else{
                self.view?.showToastError(error: "Complete no devolvio 0")
            }
            
        }, failHandler: {error in
            self.view?.showToastError(error: error.localizedDescription)
        })
    }
    func setCompleteRequestNotVerify()  {
        let complete = Complete()
        complete.name = "tkn_test_5SCRbeJ0gph4s0Bz"
        complete.mail = getSession().getEmail()
        complete.dni = getSession().getDocument()
        complete.operationDate = String(Date().millisecondsSince1970)
        print("COMPLETE: name:\(complete.name), email:\(complete.mail), dni: \(complete.dni), operation_date : \(complete.operationDate)")
        getRestClient().postComplete(complete: complete, successHandler: {response in
            if response.resulCode! == "0"{
                print("RESULT CODE : \(response.resulCode)")
                self.view?.hideLoadingView()
            }else{
                self.view?.showToastError(error: "Complete no devolvio 0")
            }
            
        }, failHandler: {error in
            self.view?.showToastError(error: error.localizedDescription)
        })
    }
}
