//
//  CompleteResponse.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

public class CompleteResponse: BaseObject {
    
    var resulCode: String!

    enum CodingKeys: String, CodingKey {
        case resulCode = "resul_code"
    }

    public override init() {
        super.init()
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resulCode = try container.decode(String.self, forKey: .resulCode)
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(resulCode, forKey: .resulCode)
    }
}
