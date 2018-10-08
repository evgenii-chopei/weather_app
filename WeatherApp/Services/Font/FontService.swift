//
//  Fonts.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/8/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import UIKit

enum FontService: String {
    case heiti_sc = "Heiti SC"
}

extension FontService {
    
    func font(of size: CGFloat = 17.0) -> UIFont {
        var font: UIFont?
        switch self {
        case .heiti_sc:
            font = UIFont.init(name: self.rawValue, size: size)
        default:
            font = UIFont.systemFont(ofSize: size)
        }
        return font ?? UIFont.systemFont(ofSize:size)
    }
}
