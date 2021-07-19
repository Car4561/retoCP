//
//  CompletePaymentConfiguration.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

protocol CompletePaymentConfigurationProtocol {
    func configure(view: CompletePaymentViewController)
}

class CompletePaymentConfiguration: CompletePaymentConfigurationProtocol {
    func configure(view : CompletePaymentViewController) {
        view.presenter = CompletePaymentPresenter(view: view)
    }
}
