//
//  CityService.swift
//  iWeather
//
//  Created by Martin Vacas on 26/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import Foundation
import SwiftyJSON

class CityService {
    
    //SINGLETON
    static let sharedInstance = CityService()
    
    //Retorna lista con las ciudades
    func getCityList() -> [City]? {
        if let path = Bundle.main.path(forResource: "city.list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do{
                    let json =  try JSONSerialization.jsonObject(with: data, options: [])
                    
                    if let cityList = json as? [[String:Any]] {
                        var cityResultList: [City] = []
                        var cityName: String
                        var cityId: String
                        var cityCountry: String
                        
                        for cityInfo in cityList {
                            cityName = String(describing: cityInfo["name"]!)
                            cityId = String(describing: cityInfo["id"]!)
                            cityCountry = String(describing: cityInfo["country"]!)
                            cityResultList.append(City(name: cityName, id: cityId, country: cityCountry))
                        }
                        
                        return cityResultList
                    } else {
                        return nil
                    }
                }catch let error{
                    print(error.localizedDescription)
                    return nil
                }
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        } else {
            print("Invalid filename/path.")
            return nil
        }
    }

}
