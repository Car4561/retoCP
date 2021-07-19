//
//  CandyStoreConfiguration.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation


protocol CandyStoreConfigurationProtocol {
    func configure(view: CandyStoreViewController)
}

class CandyStoreConfiguration: CandyStoreConfigurationProtocol {
    func configure(view : CandyStoreViewController) {
        view.presenter = CandyStorePresenter(view: view)
    }
}
