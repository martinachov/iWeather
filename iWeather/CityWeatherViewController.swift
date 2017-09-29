//
//  CityWeatherViewController.swift
//  iWeather
//
//  Created by Martin Vacas on 28/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import UIKit

class CityWeatherViewController: UIViewController {

    var actualCity: City?
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityTempLabel: UILabel!
    @IBOutlet var tempMinimaLabel: UILabel!
    @IBOutlet var tempMaximaLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLabel.text = actualCity?.name
        cityTempLabel.text = formatTempValue((actualCity?.weather.temp)!) + "º"
        tempMaximaLabel.text = "Temp. Max: " + formatTempValue((actualCity?.weather.temp_max)!) + "º"
        tempMinimaLabel.text = "Temp. Min: " + formatTempValue((actualCity?.weather.temp_min)!) + "º"
        humidityLabel.text = "Humedad Actual: " + (actualCity?.weather.humidity)! + "%"
    }
    
    //Redondea el valor de la temperatura y devuelve un entero
    private func formatTempValue(_ temp: String) -> String {
        let num = (temp as NSString).floatValue
        return String(format: "%.0f", num)
    }


}
