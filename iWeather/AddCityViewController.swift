//
//  AddCityViewController.swift
//  iWeather
//
//  Created by Martin Vacas on 26/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import UIKit

// Protocolo usado para mandar la ciudad seleccionada al controller correspondiente
protocol DataEnteredDelegate: class {
    func cityIsSelected(_ info: City)
}

class AddCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    //Referencia al Controller delegado que va a manejar el evento de ciudad seleccionada
    // making this a weak variable so that it won't create a strong reference cycle
    weak var delegate: UIViewController? = nil
    
    @IBOutlet var tableView: UITableView!
    
    //Variables para la implementacion del SearchBar
    var cityList = [City]()
    var filteredCity = [City]()
    var searchController = UISearchController()
    var resultController = UITableViewController()
    
    //------------Lifecycle------------//
    override func viewDidLoad() {
        super.viewDidLoad()
        cityList = CityService.sharedInstance.getCityList()!
        
        //Agrego a la tabla la SearchBar con su controller
        searchController = UISearchController(searchResultsController: resultController)
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.searchResultsUpdater = self
        resultController.tableView.delegate = self
        resultController.tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goBackSegue"){
            let viewController:CustomViewController = segue.destination as! CustomViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            viewController.ciudades.append(self.cityList[indexPath!.row])
        }
    }
    //----------------------------------//

    //
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == resultController.tableView {
            return filteredCity.count
        } else {
            return cityList.count
        }
    }

    //
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == resultController.tableView {
            cell.textLabel?.text = filteredCity[indexPath.row].name
        } else {
            cell.textLabel?.text = cityList[indexPath.row].name
        }
        return cell
    }
    
    //Cuando se selecciona una ciudad se le informa al delegado y
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == resultController.tableView {
            // call this method on whichever class implements our delegate protocol
//            delegate?.cityIsSelected(filteredCity[indexPath.row])
            // go back to the previous view controller
//            navigationController?.popViewController(animated: true)
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            self.performSegue(withIdentifier: "goBackSegue", sender: self)
        } else {
//            delegate?.cityIsSelected(cityList[indexPath.row])
//            navigationController?.popViewController(animated: true)
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            self.performSegue(withIdentifier: "goBackSegue", sender: self)
        }
    }
    
    //
    public func updateSearchResults(for searchController: UISearchController) {
        filteredCity = cityList.filter({ (city:City) -> Bool in
            if city.name.contains(searchController.searchBar.text!) {
                return true
            } else {
                return false
            }
        })
        resultController.tableView.reloadData()
    }
}
