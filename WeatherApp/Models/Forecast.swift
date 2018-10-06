//
//  Forecast.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/6/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

@objc(Forecast)
class Forecast: NSManagedObject, Codable {
    
    @NSManaged var forecastDays: NSOrderedSet?
    
    private enum CodingKeys: String, CodingKey {
        case forecastDays = "forecastday"
    }
    
    private enum RootKeys: String, CodingKey {
        case forecast
    }
    
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
    //    try container.encode(forecastDays, forKey: .forecastDays)
       
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Forecast", in: managedObjectContext) else {
                fatalError("Failed to decode ForecastDay!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let root = try decoder.container(keyedBy: RootKeys.self)
        let sub = try root.nestedContainer(keyedBy: CodingKeys.self, forKey: .forecast)
        
     //   let values = try sub.nestedContainer(keyedBy: CodingKeys.self, forKey: .forecastDays)
        forecastDays = NSOrderedSet(array:try sub.decode([ForecastDay].self, forKey: .forecastDays))
        
    }
}
