//
//  CandyStore.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation

public class CandyStore : BaseObject {
    
    var description: String!
    var price: String!
    var image : String!
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case price = "price"
        case image = "name"  // la api devuelve la url de la imagén en "name", con este código se le cambia el nombre al modelo para que sea mas legible

    }
    public override init() {
        super.init()
        
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.price = try container.decode(String.self, forKey: .price)
        self.image = try container.decode(String.self, forKey: .image)
        self.description = try container.decode(String.self, forKey: .description)

        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(price, forKey: .price)
        try container.encode(image, forKey: .image)
        try container.encode(description, forKey: .description)

    }
    
}
