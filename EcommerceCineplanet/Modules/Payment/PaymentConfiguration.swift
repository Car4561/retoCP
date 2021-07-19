//
//  PaymentConfiguration.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

protocol PaymentConfigurationProtocol {
    func configure(view: PaymentViewController)
}

class PaymentConfiguration: PaymentConfigurationProtocol {
    func configure(view : PaymentViewController) {
        view.presenter = PaymentPresenter(view: view)
    }
}
