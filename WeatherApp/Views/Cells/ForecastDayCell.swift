//
//  ForecastDayCell.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/7/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import UIKit
import AlamofireImage

struct ForecastDayDisplayItem {
    var date: String?
    var image: UIImage?
    var condition: String?
    var lowTempC: String?
    var upperTempC: String?
}

class ForecastDayCell: UICollectionViewCell {
    
    private var stackView: UIStackView = UIStackView()
    private var dateLabel: UILabel = UILabel(style: CellTitleStyle())
    private var conditionImageView: UIImageView = UIImageView()
    private var conditionTextLabel: UILabel = UILabel(style: SubtitleStyle())
    private var minTempLabel: UILabel = UILabel(style: AdditionalInfoStyle())
    private var maxTempLabel: UILabel = UILabel(style: AdditionalInfoStyle())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupLabels()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.enableConstraits()
        addSubview(stackView)
        stackView.constraitFullStretch(to: self)
    }
    
    private func setupLabels() {
        let tempStackView = UIStackView()
        tempStackView.distribution = .fillEqually
        [minTempLabel, maxTempLabel].forEach {
            tempStackView.addArrangedSubview($0)
        }
        
        [dateLabel,conditionImageView,conditionTextLabel, tempStackView].forEach {
           $0.enableConstraits()
        stackView.addArrangedSubview($0)
        }
    }
    
    
    func setup(with displayItem: ForecastDayDisplayItem?) {
        dateLabel.text = displayItem?.date
        conditionImageView.contentMode = .scaleAspectFit
        conditionImageView.image = displayItem?.image
        conditionTextLabel.text = displayItem?.condition
        minTempLabel.text = displayItem?.lowTempC
        maxTempLabel.text = displayItem?.upperTempC
    }
}
