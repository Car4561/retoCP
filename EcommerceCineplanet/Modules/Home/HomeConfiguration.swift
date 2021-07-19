//
//  HomeConfiguration.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation

protocol HomeConfigurationProtocol {
    func configure(view: HomeViewController)
}

class HomeConfiguration: HomeConfigurationProtocol {
    
    func configure(view : HomeViewController) {
        view.presenter = HomePresenter(view: view)
    }
}
