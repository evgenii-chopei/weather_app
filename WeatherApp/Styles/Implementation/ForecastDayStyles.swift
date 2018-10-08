//
//  UILabel+Styles.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/8/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import UIKit


struct CellTitleStyle: UILabelStyle {
    
    var font: UIFont {
        return FontService.heiti_sc.font(of: 25.0)
    }
    
    var textColor: UIColor {
        return .white
    }
    
    var textAligment: NSTextAlignment {
        return .center
    }
    
    var maxLines: Int {
        return 1
    }
}


struct SubtitleStyle: UILabelStyle {
   
    var font: UIFont {
        return FontService.heiti_sc.font(of: 13.0)
    }
    
    var textColor: UIColor {
        return .darkGray
    }
    
    var textAligment: NSTextAlignment {
        return .center
    }
    
    var maxLines: Int {
        return 2
    }
}

struct AdditionalInfoStyle: UILabelStyle {
    var font: UIFont {
        return FontService.heiti_sc.font(of: 15.0)
    }
    
    var textColor: UIColor {
        return .white
    }
    
    var textAligment: NSTextAlignment {
        return .center
    }
    
    var maxLines: Int {
        return 1
    }
    
    
}

