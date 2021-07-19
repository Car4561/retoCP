//
//  CulqiToken.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation


public class CulqiTokenRequest : BaseObject {
    
    var cardNumber : String!
    var cvv: String!
    var expirationMonth: String!
    var expirationYear: String!
    var email: String!
    
    //Renombrando
    enum CodingKeys: String, CodingKey {
        case cardNumber = "card_number"
        case cvv = "cvv"
        case expirationMonth = "expiration_month"
        case expirationYear = "expiration_year"
        case email = "email"

    }
    public override init() {
        super.init()
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardNumber = try container.decode(String.self, forKey: .cardNumber)
        self.cvv = try container.decode(String.self, forKey: .cvv)
        self.expirationMonth = try container.decode(String.self, forKey: .expirationMonth)
        self.expirationYear = try container.decode(String.self, forKey: .expirationYear)
        self.email = try container.decode(String.self, forKey: .email)
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cardNumber, forKey: .cardNumber)
        try container.encode(cvv, forKey: .cvv)
        try container.encode(expirationMonth, forKey: .expirationMonth)
        try container.encode(expirationYear, forKey: .expirationYear)
        try container.encode(email, forKey: .email)

    }
}
