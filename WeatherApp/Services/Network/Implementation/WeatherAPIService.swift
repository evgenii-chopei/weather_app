//
//  WeatherAPIService.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/30/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

typealias CitiesClosure = ((_ cities:[CityPrediction]) -> Void)
typealias CurrentWeatherClosure = ((_ currentWeather: CurrentWeather) -> Void)
typealias ForecastClosure = ((_ forecasts: Forecast) -> Void)

enum WeatherAPIService {
    
    static func requestCityNamesWith(_ text: String, response: @escaping CitiesClosure) {
        Network().request(WeatherEndpoint.searchCity(text)) { (cities) in
            response(cities)
        }
    }
    
    static func currentWeatherFor(_ city: String, response: @escaping CurrentWeatherClosure) {
        Network().request(WeatherEndpoint.currentWeather(city)) { (currentWeather) in
            response(currentWeather)
        }
    }
    
    static func forecastWeatherFor(_ city: String, days: Int = 3, context: NSManagedObjectContext, response: @escaping ForecastClosure) {
        Network().request(WeatherEndpoint.forecastWeather(city, days: days), in: context) { (forecasts) in
            response(forecasts)
        }
    }
    
}

