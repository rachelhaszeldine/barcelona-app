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
    
    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var descriptionText: UILabel!
    
    func displayProperties(place: Place) {
        loadViewIfNeeded()
        textLabel.text = place.name
        descriptionText.text = place.description
        downloadImage(place: place)
    }
    
    func downloadImage(place: Place) {
        
        guard let urlString = place.imageURLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else {
            return
        }

        
        downloadImage(atURL: url)
    }
    
    func downloadImage(atURL url: URL) {
        let urlSesssion = URLSession.shared
        
        let urlRequest = URLRequest(url: url)
        
        let imageDownloadTask = urlSesssion.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            //If image data exists and there is no error
            if let imageData = data, error == nil {
                
                //If we can create an image from the image data
                if let image = UIImage(data: imageData) {
                    
                    //Jump back to main thread
                    DispatchQueue.main.async {
                        // Upade image in our cell
                        self?.placeImage.image = image
                    }
                    
                }
                
            }
            
        }
        
        imageDownloadTask.resume()
    }
    
    
    // view lifecyle order below
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
