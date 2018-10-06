//
//  City.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/30/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

@objc(City)
class City: NSManagedObject, Codable {
    
    @NSManaged public var country: String?
    @NSManaged public var id: Int64
    @NSManaged public var lat: Double
    @NSManaged public var lon: Double
    @NSManaged public var name: String?
    @NSManaged public var region: String?
    @NSManaged public var lastWeather: CurrentWeather?
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }
    
    //MARK: Codable
    
    private enum CodingKeys: String, CodingKey {
        case id, country,lat,lon,name,region
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(country, forKey: .country)
        try container.encode(lat, forKey: .lat)
        try container.encode(lon, forKey: .lon)
        try container.encode(name, forKey: .name)
        try container.encode(region, forKey: .region)
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "City", in: managedObjectContext) else {
                fatalError("Failed to decode City!")
                //TODO: log
                var name = "name"
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int64.self, forKey: .id)
        lat = try values.decode(Double.self, forKey: .lat)
        lon = try values.decode(Double.self, forKey: .lon)
        name = try values.decode(String.self, forKey: .name)
        region = try values.decode(String.self, forKey: .region)
        country = try values.decode(String.self, forKey: .country)
    }
    
    convenience init(cityPrediction: CityPrediction, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "City", in: context)
        self.init(entity: entity!, insertInto: context)
        id = cityPrediction.id
        lat = cityPrediction.lat
        lon = cityPrediction.lon
        name = cityPrediction.name
        region = cityPrediction.region
        country = cityPrediction.country
        
    }
}
