//
//  WeatherEndpoint.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/30/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation


fileprivate var APIXU_APIKEY: String = "ce4af658574948c2abe172055182909"

enum WeatherEndpoint {
    
    case searchCity(_ text: String)
    case currentWeather(_ cityName: String)
    case forecastWeather(_ cityName: String)
    
}

extension WeatherEndpoint: Endpoint {
    var baseURL: String {
        return "https://api.apixu.com/v1"
    }
    
    var parameters: [String : String] {
        switch self {
            
        case .searchCity(let cityName):
            return defaultParameters(cityName)
        case .forecastWeather(let cityName):
            return  defaultParameters(cityName)
        case .currentWeather(let cityName):
            return defaultParameters(cityName)
        }
    }
    
    var path: String {
        
        switch self {
        case .searchCity(_):
            return "/search.json"
        case .forecastWeather(_):
            return "/forecast.json"
        case .currentWeather(_):
            return "/current.json"
        }
    }
    
    var method: RequestMethod {
        return .get
    }
}

extension WeatherEndpoint {
    
    private func defaultParameters(_ city: String) -> [String: String] {
        return ["key": APIXU_APIKEY,
                "q": city]
    }
}

