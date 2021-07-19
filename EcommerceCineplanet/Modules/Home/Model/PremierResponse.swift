//
//  Slide.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 16.07.21.
//

import Foundation

public class PremierResponse : BaseObject {
  
    var premieres : [Premier]!
   
    enum CodingKeys: String, CodingKey {
        case premieres = "premieres"

    }
    
    public override init() {
        super.init()
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.premieres = try container.decode([Premier].self, forKey: .premieres)
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(premieres, forKey: .premieres)
    }
    
}
