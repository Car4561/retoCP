//
//  MenuConfiguration.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 16.07.21.
//

import Foundation

protocol MenuConfigurationProtocol {
    func configure(view: MenuViewController)
}

class MenuConfiguration: MenuConfigurationProtocol {
    
    func configure(view : MenuViewController) {
        view.presenter = MenuPresenter(view: view)
    }
}
