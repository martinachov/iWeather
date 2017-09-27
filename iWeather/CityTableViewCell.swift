//
//  CityTableViewCell.swift
//  iWeather
//
//  Created by Martin Vacas on 26/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
