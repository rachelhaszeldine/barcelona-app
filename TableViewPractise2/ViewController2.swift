//
//  ViewController2.swift
//  TableViewPractise2
//
//  Created by Rachel Quartly on 11/04/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import UIKit

final class ViewController2: UIViewController {
    
    static let storyBoardID = "ViewController2"
    
    @IBOutlet weak var textLabel: UILabel!
    
    var input: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textLabel.text = input
    }
}
