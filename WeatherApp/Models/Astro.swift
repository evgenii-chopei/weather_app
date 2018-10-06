//
//  Astro.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/5/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

@objc(Astro)
class Astro: NSManagedObject, Codable {
  
     @NSManaged var sunrise: String?
     @NSManaged var sunset: String?
     @NSManaged var moonrise: String?
     @NSManaged var moonset: String?    
    
    private enum CodingKeys: String, CodingKey {
        case sunrise, sunset,moonrise,moonset
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sunrise, forKey: .sunrise)
        try container.encode(sunset, forKey: .sunset)
        try container.encode(moonrise, forKey: .moonrise)
        try container.encode(moonset, forKey: .moonset)

    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Astro", in: managedObjectContext) else {
                fatalError("Failed to decode Astro!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sunrise = try values.decode(String.self, forKey: .sunrise)
        sunset = try values.decode(String.self, forKey: .sunset)
        moonrise = try values.decode(String.self, forKey: .moonrise)
        moonset = try values.decode(String.self, forKey: .moonset)
       
    }
}


