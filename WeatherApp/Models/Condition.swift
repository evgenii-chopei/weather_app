//
//  Condition.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/30/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

@objc(Condition)
public class Condition: NSManagedObject, Codable {
    
    @NSManaged public var text: String?
    @NSManaged public var icon: String?
    @NSManaged public var code: Int32
    
    enum CodingKeys: String, CodingKey {
        case text, icon, code
    }
    
    //MARK: Codable
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encode(icon, forKey: .icon)
        try container.encode(code, forKey: .code)
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Condition", in: managedObjectContext) else {
                fatalError("Failed to decode Condition!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decode(String.self, forKey: .text)
        code = try values.decode(Int32.self, forKey: .code)
        icon = try values.decode(String.self, forKey: .icon)
    }
    
}
