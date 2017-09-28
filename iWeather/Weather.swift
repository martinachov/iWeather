//
//  Weather.swift
//  iWeather
//
//  Created by Martin Vacas on 26/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import Foundation
import SwiftyJSON

class Weather {
    
    var temp: String!
    var temp_min: String!
    var temp_max: String!
    var humidity: String!
    var icon: String!
    
    init(weatherJSON: JSON) {
        self.temp = weatherJSON["main"]["temp"].stringValue
        self.temp_max = weatherJSON["main"]["temp_max"].stringValue
        self.temp_min = weatherJSON["main"]["temp_min"].stringValue
        self.humidity = weatherJSON["main"]["humidity"].stringValue
        self.icon = weatherJSON["weather"].arrayValue[0]["icon"].stringValue
    }
    
}
