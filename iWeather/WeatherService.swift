//
//  WeatherService.swift
//  iWeather
//
//  Created by Martin Vacas on 28/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherService {
    
    //SINGLETON
    static let sharedInstance = WeatherService()
    
    //CONSTANTS
    let openWeatherURL = "http://api.openweathermap.org/data/2.5/weather?"
    let iconURL = "http://openweathermap.org/img/w/"
    let iconExtension = ".png"
    let units = "units=metric"
    let appid = "appid=5f4ff9c2842fb16fdbefb7744e698d7f"
    
    //Get weather from city name
    func getCityWeather(_ cityId:String, onCompletion: @escaping (JSON)-> Void) {

        let idParameter = "id=" + cityId
        let url = openWeatherURL + idParameter + "&" + units + "&" + appid
        print("URL: \(url)")
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result{
            case .success(let data):
                let response = JSON(data)
                onCompletion(response)
            case .failure(let error):
                print("Error \(error)")
                onCompletion(JSON.null)
            }
        }
    }
    
    //Get icon weather image
    func getIconImage(_ iconId:String, onCompletion: @escaping (UIImage?) -> Void ) {
        let url = iconURL + iconId + iconExtension
        print("ICON URL: \(url)")
        Alamofire.request(url).responseData { response in
            switch response.result{
            case .success(let data):
                let response = UIImage(data: data)
                onCompletion(response!)
            case .failure(let error):
                print("Error descargando imagen \(error)")
                onCompletion(nil)
            }
        }
    }
    
}
