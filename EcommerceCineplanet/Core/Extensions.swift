//
//  Extensions.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage
import SVProgressHUD


extension UIImageView {
    
    func imageFromUrl(urlString: String) {
        let downloader = ImageDownloader()
          if let url = URL(string: urlString) {
                 let urlRequest = URLRequest(url: URL(string: urlString)!)
                downloader.download(urlRequest) { response in
                if let data = response.value {
                    self.image = data
                }else{
                    /*El api devuelve una url incorrecta de la imagén ultimo Premier  (extension .jpgg en lugar de de .jpg)
                     la api devuelve :https://i.pinimg.com/originals/39/25/c0/3925c0ea3a23654c9fb977e931649d82.jpgg
                     corregido a : https://i.pinimg.com/originals/39/25/c0/3925c0ea3a23654c9fb977e931649d82.jpg
                     */
                    self.imageFromUrl(urlString: "https://i.pinimg.com/originals/39/25/c0/3925c0ea3a23654c9fb977e931649d82.jpg") 
                }
            }
            } else {
        }

        
    }
    
}

extension UIViewController {
    
    func toast(message: String) {
        self.view.makeToast(message)
    }
    
    func showAlertWelcome(title : String, message: String , tabBar: UITabBarController)  {
        
        let alert = UIAlertController(title : title,message : message, preferredStyle : .alert)

        let action = (UIAlertAction(title: "Aceptar", style: .default, handler: { action in
            self.tabBarController?.selectedIndex = 2
            (self.tabBarController?.navigationItem.titleView as! UILabel).text = "Dulceria"
        }))

        alert.addAction(action)
        alert.preferredAction = action
        self.present(alert, animated: true)
    }
    
    func waiting(message: String) {
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show(withStatus: message)
    }
    
    func closeWaiting() {
        SVProgressHUD.dismiss()
    }
    
    func hideKeyboardWhenTappedAround() {
     let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
      tap.cancelsTouchesInView = false
      view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
       view.endEditing(true)
    }

}

extension UINavigationController{
    public func removePreviousController(total: Int){
        let totalViewControllers = self.viewControllers.count
        if(totalViewControllers-total > -1){
            self.viewControllers.removeSubrange(totalViewControllers-total..<totalViewControllers - 1)
        }
    }
}



  
extension CGFloat {
    static func randomValue() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(
           red:   .randomValue(),
           green: .randomValue(),
           blue:  .randomValue(),
           alpha: 1.0
        )
    }
}
extension UICollectionViewCell {
    func shadowDecorate() {
        let radius: CGFloat = 0
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
    
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
}
extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

extension PaymentViewController{
    @objc func keyboardWillShow(notification:NSNotification){

        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {

            let userInfo = notification.userInfo!
            var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)

            var contentInset:UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height - 100
         
            scrollView.contentInset = contentInset
        }
        
    }

    @objc func keyboardWillHide(notification:NSNotification){

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
        
}
extension String {
    func isValidEmail() -> Bool {
                print("validate emilId: \(self)")
                let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                let result = emailTest.evaluate(with: self)
                return result
    }
        
    func isValidCardNumber() -> Bool {
        if !isNumber() || self.count < 15 || self.count > 19{
            return false
        }
        return true
    }
    
    func isValidMonth() -> Bool {
         if !isNumber() || self.count > 2 {
             return false
         }
         return true
    
    }
     
    func isValidYear() -> Bool {
         if !isNumber() || self.count > 2 {
             return false
         }
         return true
    
    }
    
    func isValidCVV() -> Bool {
         if !isNumber() || self.count < 3  || self.count > 4{
             return false
         }
         return true
    
    }
     
    
    func isValidDocument() -> Bool {
         if !isNumber() || self.count < 8  || self.count > 11{
             return false
         }
         return true
    
    }
     
    func isNumber() -> Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
   
}
@IBDesignable class PaddingLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}

extension Date {
    
    var millisecondsSince1970:Int64 {
        
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
        
    }

    init(milliseconds:Int64) {
        
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
        
    }
    
}

extension UIDevice {
    
    var hasNotch: Bool {
        if #available(iOS 11.0,  *) {
            
            var safeAreaInset: CGFloat?
            if (UIApplication.shared.statusBarOrientation == .portrait) {
                safeAreaInset = UIApplication.shared.delegate?.window??.safeAreaInsets.top
            }
            else if (UIApplication.shared.statusBarOrientation == .landscapeLeft) {
                safeAreaInset = UIApplication.shared.delegate?.window??.safeAreaInsets.left
            }
            else if (UIApplication.shared.statusBarOrientation == .landscapeRight) {
                safeAreaInset = UIApplication.shared.delegate?.window??.safeAreaInsets.right
            }
            return safeAreaInset ?? 0 > 24
        }
        return false
    }
}
