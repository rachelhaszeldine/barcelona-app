//
//  BarcelonaCell.swift
//  TableViewPractise2
//
//  Created by Rachel Quartly on 07/04/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import UIKit

var images = [String: UIImage]()

class BarcelonaCell: UITableViewCell {
    
    @IBOutlet var placeName: UILabel!
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var placeImage: UIImageView!
    private var currentlyFetchingUrlString = ""

    override func prepareForReuse() {
        super.prepareForReuse()
        placeImage.image = nil
    }
    
    func configure(withPlaceName placeName: String, andURLString urlString: String) {
        self.placeName.text = placeName
        guard let url = URL(string: urlString) else {
            return
        }
    
        downloadImage(atURL: url)
    }
    
    func configure(withPlace place: Place) {
        self.placeName.text = place.name
    
        guard let urlString = place.imageURLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else {
            return
        }
        
        currentlyFetchingUrlString = url.absoluteString
        if let image = images[url.absoluteString] {
            placeImage.image = image
            spinner.stopAnimating()
        } else {
            spinner.startAnimating()
            downloadImage(atURL: url)
        }
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
                        images[url.absoluteString] = image
                        if self?.currentlyFetchingUrlString != url.absoluteString {
                            return
                        }
                        self?.placeImage.image = image
                        self?.spinner.stopAnimating()
                    }
                    
                }
                
            }
        }
        
        imageDownloadTask.resume()
    }
}
