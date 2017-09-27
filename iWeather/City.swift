//
//  City.swift
//  iWeather
//
//  Created by Martin Vacas on 26/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import Foundation

class City {
    
    var name: String!
    var id: String!
    var country: String!
    var weather: Weather!
    
    init(name:String, id:String, country:String, weather:Weather) {
        self.name = name
        self.id = id
        self.country = country
        self.weather = weather
    }
    
    init(name:String, id:String, country:String) {
        self.name = name
        self.id = id
        self.country = country
    }
    
}
