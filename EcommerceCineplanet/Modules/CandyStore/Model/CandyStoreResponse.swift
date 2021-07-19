//
//  CandyStoreResponse.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation

public class CandyStoreResponse : BaseObject {
    var items : [CandyStore]!
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
    public override init() {
        super.init()
        
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([CandyStore].self, forKey: .items)
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
      


    }
    
}
