//
//  MenuViewController.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 16.07.21.
//

import Foundation
import UIKit

class MenuViewController: UITabBarController,UITabBarControllerDelegate, MenuViewProtocol{
    
    var configuration = MenuConfiguration()
    
    var presenter: MenuPresenterProtocol!
    
    var titleView = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration.configure(view: self)
        presenter.viewDidLoad()
            
    }
    
    
    func prepareNavigationItem() {
        titleView.textColor = Global.blueCineplanet
        titleView.text = "Cineplanet"
        titleView.textAlignment = .center
        titleView.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        self.navigationItem.titleView = titleView
    }
    
   
   
    
}
extension MenuViewController {
    // UITabBarDelegate
  
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let titles = ["Cineplanet", "Login", "Dulceria"]
       
        for i in 0...tabBar.items!.count-1 {
            if(tabBar.items![i] == item){

                titleView.text = titles[i]
               
            }
        }
        
    }

}

