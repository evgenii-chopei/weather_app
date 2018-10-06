//
//  SignleLabelTableViewCell.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/3/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import UIKit

class SignleLabelTableViewCell: UITableViewCell {

    private var label: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setText(_ text: String?) {
        label.text = text
    }
    
    private func setupLabel() {
        addSubview(label)
        label.enableConstraits()
        label.constraitCenterY(to: self)
        label.constraitLeft(to: self, constant: 20.0)
        label.constraitRight(to: self, constant: 10.0)
    }

    func background(_ color: UIColor) -> SignleLabelTableViewCell{
        backgroundColor = color
        return self
    }
    
    func text(_ text: String?) -> SignleLabelTableViewCell {
        label.text = text
        return self
    }
}
