//
//  CompletePaymentViewController.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation
import UIKit

class CompletePaymentViewController: UIViewController, CompletePaymentViewProtocol {
   
    
    var presenter : CompletePaymenPresenterProtocol!

    let configuration = CompletePaymentConfiguration()
    
    var culqiTokenRequest : CulqiTokenRequest = CulqiTokenRequest()
    
    var verify : Bool!

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var successfulView: UIView!

    var circleAnimationView: CircleAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLoadingView()
        configuration.configure(view: self)
        presenter.makePayment(culqiTokenRequest: culqiTokenRequest, verify: verify)
    }
    
    func hideLoadingView() {
        loadingView.isHidden = true
    }
    func exitViewController()  {
        navigationController?.popViewController(animated: true)

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
    @IBAction func goToHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension CompletePaymentViewController {
    func setUpLoadingView(){
        let titleView = UILabel()
        titleView.textColor = Global.blueCineplanet
        titleView.text = "Completando Pago"
        titleView.textAlignment = .center
        titleView.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        navigationController?.removePreviousController(total: 2)
        circleAnimationView = CircleAnimationView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        circleAnimationView?.center = CGPoint(x: view.center.x, y: view.center.y - 30)
        circleAnimationView?.tag = 1
        guard let circleAnimationView = circleAnimationView else { return }
        loadingView.addSubview(circleAnimationView)
    }
    
}
