//
//  Complete.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

public class Complete: BaseObject {
    var name : String!
    var mail : String!
    var dni : String!
    var operationDate : String!

    enum CodingKeys: String, CodingKey {
        case name, mail, dni
        case operationDate = "operation_date"
    }
    
    public override init() {
        super.init()
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.mail = try container.decode(String.self, forKey: .mail)
        self.dni = try container.decode(String.self, forKey: .dni)
        self.operationDate = try container.decode(String.self, forKey: .operationDate)
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(mail, forKey: .mail)
        try container.encode(dni, forKey: .dni)
        try container.encode(operationDate, forKey: .operationDate)

    }

}
