//
//  PaymentTutorialView.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation
import UIKit
class PaymentTutorialView: UIViewController {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(UIDevice().hasNotch ){
            contentSizeInPopup   =  CGSize ( width: view.bounds.width , height: view.bounds.height + 70 );
        }else{
            contentSizeInPopup   =  CGSize ( width: view.bounds.width , height: view.bounds.height + 70);
        }
      
        landscapeContentSizeInPopup   =  CGSize ( width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2 )
              
    }
 
   required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
           contentSizeInPopup   =  CGSize ( width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 8   );
                landscapeContentSizeInPopup   =  CGSize ( width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 5 )
      }
    
  
}
