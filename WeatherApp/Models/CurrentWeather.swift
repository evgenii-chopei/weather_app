//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/30/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

@objc(CurrentWeather)
public class CurrentWeather: NSManagedObject, Codable {
    
    @NSManaged public var updateTime: String?
    @NSManaged public var updateTimestamp: Int32
    @NSManaged public var temp_c: Int16
    @NSManaged public var feelslike_c: Int16
    @NSManaged public var condition: Condition?
    @NSManaged public var wind_kph: Int32
    @NSManaged public var wind_degree: Int16
    @NSManaged public var wind_dir: String?
    @NSManaged public var pressure_mb: Int64
    @NSManaged public var precip_mm: Int64
    @NSManaged public var humidity: Int16
    @NSManaged public var cloud: Int16
    @NSManaged public var isDay: Int16
    
    //MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case updateTime = "last_updated"
        case updateTimestamp = "last_updated_epoch"
        case isDay = "is_day"
        case temp_c, feelslike_c, wind_kph, wind_degree, wind_dir, pressure_mb, precip_mm, humidity, cloud, condition
    }
    
    //MARK: - Encodable
    
    public func encode(to encoder: Encoder) throws {
       
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(updateTime, forKey: .updateTime)
        try container.encode(updateTimestamp, forKey: .updateTimestamp)
        try container.encode(temp_c, forKey: .temp_c)
        try container.encode(feelslike_c, forKey: .feelslike_c)
        try container.encode(condition, forKey: .condition)
        try container.encode(wind_kph, forKey: .wind_kph)
        try container.encode(wind_degree, forKey: .wind_degree)
        try container.encode(wind_dir, forKey: .wind_dir)
        try container.encode(pressure_mb, forKey: .pressure_mb)
        try container.encode(precip_mm, forKey: .precip_mm)
        try container.encode(humidity, forKey: .humidity)
        try container.encode(cloud, forKey: .cloud)
        try container.encode(isDay, forKey: .isDay)
        
    }
    
    //MARK: - Decodable
    
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "CurrentWeather", in: managedObjectContext) else {
                fatalError("Failed to decode CurrentWeather!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        updateTime = try values.decode(String.self, forKey: .updateTime)
        updateTimestamp = try values.decode(Int32.self, forKey: .updateTimestamp)
        temp_c = try values.decode(Int16.self, forKey: .temp_c)
        feelslike_c = try values.decode(Int16.self, forKey: .feelslike_c)
        condition = try values.decode(Condition.self, forKey: .condition)
        wind_kph = try values.decode(Int32.self, forKey: .wind_kph)
        wind_degree = try values.decode(Int16.self, forKey: .wind_degree)
        wind_dir = try values.decode(String.self, forKey: .wind_dir)
        pressure_mb = try values.decode(Int64.self, forKey: .pressure_mb)
        precip_mm = try values.decode(Int64.self, forKey: .precip_mm)
        humidity = try values.decode(Int16.self, forKey: .humidity)
        cloud = try values.decode(Int16.self, forKey: .cloud)
        isDay = try values.decode(Int16.self, forKey: .isDay)
    }
    
}


