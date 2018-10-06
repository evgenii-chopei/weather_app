//
//  ForecastDay.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/5/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

@objc(ForecastDay)
class ForecastDay: NSManagedObject, Codable {
    
    @NSManaged var date: String?
    @NSManaged var date_epoch: Double
    @NSManaged var maxtemp_c: Double
    @NSManaged var avgtemp_c: Double
    @NSManaged var maxwind_kph: Double
    @NSManaged var totalprecip_mm: Double
    @NSManaged var avgvis_km: Double
    @NSManaged var avghumidity: Double
    @NSManaged var condition: Condition?
    @NSManaged var astro: Astro?
    @NSManaged var uv: Double
    
    //MARK: Codable
    
    private enum CodingKeys: String, CodingKey {
        case date,date_epoch,maxtemp_c,avgtemp_c, maxwind_kph, totalprecip_mm, avgvis_km, avghumidity, condition, astro, uv, day
    }
    private enum CodingKeysDay: String,CodingKey {
        case maxtemp_c,avgtemp_c, maxwind_kph, totalprecip_mm, avgvis_km, avghumidity, condition,uv
    }
    
    private enum RootKeys: String, CodingKey {
        case forecast, forecastday
    }
    
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(date_epoch, forKey: .date_epoch)
        try container.encode(maxtemp_c, forKey: .maxtemp_c)
        try container.encode(avgtemp_c, forKey: .avgtemp_c)
        try container.encode(maxwind_kph, forKey: .maxwind_kph)
        try container.encode(totalprecip_mm, forKey: .totalprecip_mm)
        try container.encode(avgvis_km, forKey: .avgvis_km)
        try container.encode(avghumidity, forKey: .avghumidity)
        try container.encode(condition, forKey: .condition)
        try container.encode(astro, forKey: .astro)
        try container.encode(uv, forKey: .uv)

    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "ForecastDay", in: managedObjectContext) else {
                fatalError("Failed to decode ForecastDay!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decode(String.self, forKey: .date)
        date_epoch = try values.decode(Double.self, forKey: .date_epoch)
        astro = try values.decode(Astro.self, forKey: .astro)
        
        let dayValues = try values.nestedContainer(keyedBy: CodingKeysDay.self, forKey: .day)
        maxtemp_c = try dayValues.decode(Double.self, forKey: .maxtemp_c)
        avgtemp_c = try dayValues.decode(Double.self, forKey: .avgtemp_c)
        condition = try dayValues.decode(Condition.self, forKey: .condition)
        avghumidity = try dayValues.decode(Double.self, forKey: .avghumidity)
        totalprecip_mm = try dayValues.decode(Double.self, forKey: .totalprecip_mm)
        avgvis_km = try dayValues.decode(Double.self, forKey: .avgvis_km)
        uv = try dayValues.decode(Double.self, forKey: .uv)
    }
}

