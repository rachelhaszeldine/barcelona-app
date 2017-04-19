//
//  BarcelonaCell.swift
//  TableViewPractise2
//
//  Created by Rachel Quartly on 07/04/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import UIKit

class BarcelonaCell: UITableViewCell, StringConfigurable {
    
    @IBOutlet weak var placeName: UILabel!
    
    @IBOutlet weak var placeImage: UIImageView!

    func configure(withString string: String) {
        placeName.text = string
    }
}
