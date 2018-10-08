//
//  UILabelStyle.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/8/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import UIKit

protocol UILabelStyle {
    var font: UIFont { get }
    var textColor: UIColor { get }
    var textAligment: NSTextAlignment { get }
    var maxLines: Int { get }
}
