//
//  WeatherAPIService.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/30/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation

typealias CitiesClosure = ((_ cities:[City]) -> Void)
typealias CurrentWeatherClosure = ((_ currentWeather: CurrentWeather) -> Void)

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
    
}

