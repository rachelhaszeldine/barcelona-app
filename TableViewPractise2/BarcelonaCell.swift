//
//  BarcelonaCell.swift
//  TableViewPractise2
//
//  Created by Rachel Quartly on 07/04/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import UIKit

class BarcelonaCell: UITableViewCell {
    
    @IBOutlet var placeName: UILabel!
    
    @IBOutlet var placeImage: UIImageView!

    func configure(withPlaceName placeName: String, andURLString urlString: String) {
        self.placeName.text = placeName
        guard let url = URL(string: urlString) else {
            return
        }
    
        downloadImage(atURL: url)
    }
    
    func configure(withPlace place: Place) {
        self.placeName.text = place.name
        guard let url = URL(string: place.imageURLString) else {
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
}
