//
//  BottomTableViewCell.swift
//  iWeather
//
//  Created by Martin Vacas on 26/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import UIKit

class BottomTableViewCell: UITableViewCell {

    var tableViewDelegate: CustomViewController?
    
    //Se llama al Segue programaticamente
    @IBAction func addCity(_ sender: UIButton) {
        print("Presionado")
        self.tableViewDelegate?.performSegue(withIdentifier: "addCitySegue", sender: self)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
