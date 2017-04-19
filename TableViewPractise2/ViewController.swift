//
//  ViewController.swift
//  TableViewPractise2
//
//  Created by Rachel Quartly on 07/04/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import UIKit

protocol StringConfigurable {
    func configure(withString string: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView?
    let items: [String] = ["La Rambla", "Sagrada Família", "Park Güell", "Gothic Quarter", "Casa Milà", "Casa Batlló", "Montjuïc", "Camp Nou", "La Boqueria", "Passeig de Gràcia"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarcelonaCell", for: indexPath)
        
        if let stringConfigurableCell = cell as? StringConfigurable {
            let title = items[indexPath.row]
            stringConfigurableCell.configure(withString: title)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: ViewController2.storyBoardID) as! ViewController2
        nextVC.input = items[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func registerTableViewCells() {
//        let nib = UINib(nibName: "BarcelonaCell", bundle: nil)
//        tableView?.register(nib, forCellReuseIdentifier: "BarcelonaCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
    }
    
}
