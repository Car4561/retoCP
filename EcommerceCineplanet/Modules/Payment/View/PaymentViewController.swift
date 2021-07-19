//
//  PaymentViewController.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation
import UIKit
import STPopup

class PaymentViewController: UIViewController, PaymentViewProtocol {
   
    
   
    let configuration = PaymentConfiguration()
    
    var presenter : PaymentPresenterProtocol!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtTypeDocument: UITextField!
    @IBOutlet weak var txtDocument: UITextField!
    
    @IBOutlet weak var txtNumberCard: UITextField!
    @IBOutlet weak var txtMonth: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtCVV: UITextField!
    @IBOutlet weak var lblAmountPayable: PaddingLabel!

    @IBOutlet weak var switchVerify: UISwitch!
    
    @IBOutlet weak var btnTutorialView: UIButton!

    
    var amountPayable = "00.00"
    
    let pickerTypeDocument = UIPickerView()

    let typesDocument = ["DNI","RUC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration.configure(view: self)
        setUpLabelsAndPickerTypeDocument()
        presenter.loadForm()
    }
    
   
    func sendCacheData(fullname: String, email: String) {
        txtFullName.text = fullname
        txtEmail.text = email
    }
    
    @IBAction func payItems(_ sender: Any) {
        presenter.setPaymentData(cardNumber: txtNumberCard.text!, cvv: txtCVV.text!, expirationMonth: txtMonth.text!, expirationYear: txtYear.text!, email: txtEmail.text!,fullname: txtFullName.text!,document: txtDocument.text!,verify: switchVerify.isOn)
    }
    
    func goCompletePaymentVerify(culqiTokenRequest: CulqiTokenRequest, verify : Bool) {
        let completePaymentViewController = Global.storyBoard.instantiateViewController(withIdentifier: "CompletePaymentViewController") as! CompletePaymentViewController
        completePaymentViewController.culqiTokenRequest = culqiTokenRequest
        completePaymentViewController.verify = verify
        navigationController?.pushViewController(completePaymentViewController, animated: true)
    }
    
    func goCompletePaymentNoVerify( verify : Bool) {
        let completePaymentViewController = Global.storyBoard.instantiateViewController(withIdentifier: "CompletePaymentViewController") as! CompletePaymentViewController
        completePaymentViewController.verify = false
        navigationController?.pushViewController(completePaymentViewController, animated: true)
    }

    
    func showLoadingPopUp() {
        self.waiting(message: "Realizando transacción...")
    }
    
    func hideLoadingPopUp()  {
        self.closeWaiting()
    }
    
    func showToastError(error: String) {
        navigationController?.toast(message: error)
    }
    
    func setUpLabelsAndPickerTypeDocument() {
        let titleView = UILabel()
        titleView.textColor = Global.blueCineplanet
        titleView.text = "Completar Pago"
        titleView.textAlignment = .center
        titleView.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        self.navigationItem.titleView = titleView
        lblAmountPayable.clipsToBounds = true
        lblAmountPayable.text = amountPayable
        pickerTypeDocument.delegate = self
        txtTypeDocument.inputView = pickerTypeDocument
        pickerTypeDocument.selectRow(0, inComponent: 0, animated: false)
        hideKeyboardWhenTappedAround()
    }
    
    func initTutorial(){
        let welcomeView = Global.storyBoard.instantiateViewController(withIdentifier: "PaymentTutorialView")
        let popupController = STPopupController(rootViewController: welcomeView)
        popupController.style = .bottomSheet
        popupController.navigationBar.alpha = 1
        popupController.navigationBar.isUserInteractionEnabled = true


        UIApplication.shared.statusBarStyle = .default
        popupController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        popupController.navigationBar.shadowImage = UIImage()
        popupController.navigationBar.isTranslucent = true

        popupController.present(in: self)
    }
    @IBAction
    func openTutorial(_ sender: Any)  {
        initTutorial()
    }
    
}

extension PaymentViewController:  UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typesDocument.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typesDocument[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtTypeDocument.text = typesDocument[row]

    }
    
    
}
