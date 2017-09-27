//
//  CustomViewController.swift
//  iWeather
//
//  Created by Martin Vacas on 25/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataEnteredDelegate{

    //Tabla de ciudades
    @IBOutlet var cityTable: UITableView!
    var ciudades = [City]()
    
    
    //--------------Life Cycle--------------//
    override func viewDidLoad() {
        super.viewDidLoad()

        cityTable.delegate = self
        cityTable.dataSource = self
        
        let nibCity = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTable.register( nibCity, forCellReuseIdentifier: "cityCell")
        
        let nibBottom = UINib(nibName: "BottomTableViewCell", bundle: nil)
        cityTable.register( nibBottom, forCellReuseIdentifier: "bottomCell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCitySegue" {
            let secondViewController = segue.destination as! AddCityViewController
            secondViewController.delegate = self
        }
    }
    
    //-------------------------------------//
    

    
    //Table functions
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ciudades.count + 1
    }

    //
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var bottomCell = BottomTableViewCell()
        var cityCell = CityTableViewCell()

        //Si la tabla de ciudades esta vacia
        if  ciudades.count == 0 {
            bottomCell = cityTable.dequeueReusableCell(withIdentifier: "bottomCell", for: indexPath) as! BottomTableViewCell
            bottomCell.tableViewDelegate = self
            return bottomCell
        } else {
            //Ya recorri toda la tabla
            if indexPath.row + 1 > ciudades.count {
                bottomCell = cityTable.dequeueReusableCell(withIdentifier: "bottomCell", for: indexPath) as! BottomTableViewCell
                bottomCell.tableViewDelegate = self
                return bottomCell
            } else {
                cityCell = cityTable.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
                cityCell.cityLabel.text = ciudades[indexPath.row].name
                cityCell.timeLabel.text = self.getCurrentTime()
                cityCell.tempLabel.text = "13º"
                return cityCell
            }
        }
    }
    
    //Devuelve hora actual
    private func getCurrentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = String(calendar.component(.hour, from: date))
        let minutes = String(calendar.component(.minute, from: date))
        return hour + ":" + minutes
    }
    
    //Implementacion del metodo definido en el protocolo DataEnteredDelegate
    //Se selecciono una ciudad en otro view controller
    func cityIsSelected(_ city: City) {
        ciudades.append(city)
    }
    
}

