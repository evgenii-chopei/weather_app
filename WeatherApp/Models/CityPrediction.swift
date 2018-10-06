//
//  CityPrediction.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/5/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation

class CityPrediction: Codable {
    var id: Int64
    var name: String
    var region: String
    var country: String
    var lat: Double
    var lon: Double
    var url: String
}
