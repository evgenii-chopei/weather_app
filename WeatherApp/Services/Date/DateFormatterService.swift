//
//  DateService.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/9/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation

enum DateFormatterService {
    case YYYY_MM_DD
    case EE
    case EEEE
    
    var string: String {
        switch self {
        case .YYYY_MM_DD: return "YYYY-MM-DD"
        case .EE: return "EE"
        case .EEEE: return "EEEE"
        }
    }
    
    var formatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.string
        return dateFormatter
    }
}
