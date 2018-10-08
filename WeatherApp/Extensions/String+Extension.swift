//
//  String+Extension.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/9/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation


extension String {
    
    func imageName() -> String? {
        guard let lastComponent = self.components(separatedBy: "/").last, let imageName = lastComponent.components(separatedBy: ".").first else {
            return nil
        }
        return imageName
    }
    
    
     func suffix(_ text: String) -> String {
        return self + text
    }
    
     func preffix(_ text: String) -> String {
        return text + self
    }
}
