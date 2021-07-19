//
//  TokenCard.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

public class TokenCard: BaseObject {
    var metadata: Metadata!
    var cardNumber, lastFour: String!
    var active: Bool!
    var client: Client!
    var id: String!
    var creationDate: Int!
    var type, email, object: String!
    var iin: Iin!
    
    enum CodingKeys: String, CodingKey {
        case metadata
        case cardNumber = "card_number"
        case lastFour = "last_four"
        case active, client, id
        case creationDate = "creation_date"
        case type, email, object, iin
    }

    public override init() {
        super.init()
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metadata = try container.decode(Metadata.self, forKey: .metadata)
        self.cardNumber = try container.decode(String.self, forKey: .cardNumber)
        self.lastFour = try container.decode(String.self, forKey: .lastFour)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.client = try container.decode(Client.self, forKey: .client)
        self.id = try container.decode(String.self, forKey: .id)
        self.creationDate = try container.decode(Int.self, forKey: .creationDate)
        self.type = try container.decode(String.self, forKey: .type)
        self.email = try container.decode(String.self, forKey: .email)
        self.object = try container.decode(String.self, forKey: .object)
        self.iin = try container.decode(Iin.self, forKey: .iin)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(metadata, forKey: .metadata)
        try container.encode(cardNumber, forKey: .cardNumber)
        try container.encode(lastFour, forKey: .lastFour)
        try container.encode(active, forKey: .active)
        try container.encode(id, forKey: .id)
        try container.encode(creationDate, forKey: .creationDate)
        try container.encode(type, forKey: .type)
        try container.encode(email, forKey: .email)
        try container.encode(object, forKey: .object)
        try container.encode(iin, forKey: .iin)

    }
    
    
    
  
}
