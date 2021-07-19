//
//  PaymentPresenter.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

protocol PaymentViewProtocol : class {
    func showToastError(error: String)
    func showLoadingPopUp()
    func hideLoadingPopUp()
    func sendCacheData(fullname: String, email:String)
    func goCompletePaymentVerify(culqiTokenRequest: CulqiTokenRequest, verify : Bool)
    func goCompletePaymentNoVerify( verify : Bool)
    func initTutorial()

}

protocol PaymentPresenterProtocol : BasePresenter {
    func loadForm()
    func setPaymentData(cardNumber : String, cvv: String, expirationMonth: String, expirationYear: String, email: String,fullname:String, document:String, verify: Bool)
    func validateInputs(cardNumber : String, cvv: String, expirationMonth: String, expirationYear: String, email: String,fullname:String, document:String) -> Bool

}

class PaymentPresenter: PaymentPresenterProtocol {

    
    let view : PaymentViewProtocol?
    
    init(view: PaymentViewProtocol) {
        self.view = view
    }
    
    func loadForm()  {
        if !getSession().isViewedTutorialPayment() {
            view?.initTutorial()
        }
        getSession().set(true, "viewedTutorialPayment")
            
        if getSession().isLogged() {
            let fullname : String =  getSession().get("fullname")
            let email : String =  getSession().get("email")
            view?.sendCacheData(fullname: fullname, email: email)
        }
        
    }
    
    func setPaymentData(cardNumber : String, cvv: String, expirationMonth: String, expirationYear: String, email: String,fullname:String, document:String, verify: Bool)  {
        if !verify {
            view?.goCompletePaymentNoVerify(verify: false)
            return
        }
        if validateInputs(cardNumber: cardNumber , cvv: cvv , expirationMonth: expirationMonth, expirationYear: expirationYear, email: email,fullname: fullname, document: document) {
            print("Inputs correctos")
            
            let culqiTokenRequest = CulqiTokenRequest()

            /*
             datos de prueba :
                cardNumber = "4111111111111111"
                cvv = "123"
                email = "any@gmail.com"
                expirationMonth = "09"
                expirationYear = "2025"
            */
           
            culqiTokenRequest.cardNumber = cardNumber
            culqiTokenRequest.cvv = cvv
            culqiTokenRequest.email = email
            culqiTokenRequest.expirationMonth =  expirationMonth
            culqiTokenRequest.expirationYear = "20" + expirationYear
            getSession().set(document, "document")
            view?.goCompletePaymentVerify(culqiTokenRequest: culqiTokenRequest,verify: true)
        }
        
    }
    
    func validateInputs(cardNumber : String, cvv: String, expirationMonth: String, expirationYear: String, email: String,fullname:String, document:String) -> Bool {
            
        if cardNumber.isEmpty || cvv.isEmpty || expirationMonth.isEmpty || expirationYear.isEmpty || email.isEmpty {
            view?.showToastError(error: "Debe completar todos los campos")
            return false
        }
       
        if !email.isValidEmail() {
            view?.showToastError(error: "El formato del correo no es válido")
            return false
        }
        if !document.isValidDocument() {
            view?.showToastError(error: "El formato del documento no es válido, debe tener mínimo 8 caracteres")
            return false
        }
        if !cvv.isValidCVV() {
            view?.showToastError(error: "La clave de seguridad solo debe contener caracteres numéricos y tener 3 o 4 dígitos")
            return false
        }
        if !expirationMonth.isValidMonth() {
            view?.showToastError(error: "El mes solo debe contener caracteres numéricos y tener menos de 2 dígitos")
            return false
        }
        if !expirationYear.isValidYear() {
            view?.showToastError(error: "El año solo debe contener caracteres numéricos y tener 2 dígitos")
            return false
        }
        if !cardNumber.isValidCardNumber() {
            view?.showToastError(error: "El formato de la tarjeta de crédito no es válida")
            return false
        }
        
        return true
    }
    
  

}
