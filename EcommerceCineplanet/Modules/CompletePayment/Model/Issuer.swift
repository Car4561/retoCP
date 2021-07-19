//
//  Issuer.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation
class Issuer: Codable {
    let country, countryCode: String
    let website: JSONNull?
    let name: String
    let phoneNumber: JSONNull?

    enum CodingKeys: String, CodingKey {
        case country
        case countryCode = "country_code"
        case website, name
        case phoneNumber = "phone_number"
    }

    init(country: String, countryCode: String, website: JSONNull?, name: String, phoneNumber: JSONNull?) {
        self.country = country
        self.countryCode = countryCode
        self.website = website
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
