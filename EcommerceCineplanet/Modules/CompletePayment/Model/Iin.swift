//
//  Iin.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation
class Iin: Codable {
    let installmentsAllowed: [Int]
    let bin, cardCategory, cardBrand, cardType: String
    let issuer: Issuer
    let object: String

    enum CodingKeys: String, CodingKey {
        case installmentsAllowed = "installments_allowed"
        case bin
        case cardCategory = "card_category"
        case cardBrand = "card_brand"
        case cardType = "card_type"
        case issuer, object
    }

    init(installmentsAllowed: [Int], bin: String, cardCategory: String, cardBrand: String, cardType: String, issuer: Issuer, object: String) {
        self.installmentsAllowed = installmentsAllowed
        self.bin = bin
        self.cardCategory = cardCategory
        self.cardBrand = cardBrand
        self.cardType = cardType
        self.issuer = issuer
        self.object = object
    }
}
