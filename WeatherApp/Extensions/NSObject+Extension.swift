//
//  NSObject+Extension.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/3/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation

extension NSObject {
   
    class var className: String {
        return String(describing: self)
    }
}
