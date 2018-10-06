//
//  UIView+Extension.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/3/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import UIKit

extension UIView {
    
    func constraitFullStretch(to: UIView) {
        constraitTop(to: to)
        constraitBottom(to: to)
        constraitLeft(to: to)
        constraitRight(to: to)
    }
    
    func constraitLeft(to: UIView, constant: CGFloat = 0.0) {
        self.leftAnchor.constraint(equalTo: to.leftAnchor, constant: constant).activate()
    }
    
    func constraitRight(to: UIView, constant: CGFloat = 0.0) {
        self.rightAnchor.constraint(equalTo: to.rightAnchor, constant: -constant).activate()
    }
    
    func constraitBottom(to: UIView, constant: CGFloat = 0.0){
        self.bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: -constant).activate()
    }
    
    func constraitTop(to: UIView, constant: CGFloat = 0.0) {
        self.topAnchor.constraint(equalTo: to.topAnchor, constant: constant).activate()
    }
    
    func constraitCenterX(to: UIView) {
        self.centerXAnchor.constraint(equalTo: to.centerXAnchor).activate()
    }
    
    func constraitCenterY(to: UIView) {
        self.centerYAnchor.constraint(equalTo: to.centerYAnchor).activate()
    }
    
    func constraitHeight(_ constant: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: constant).activate()
    }
    
    func enableConstraits() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
