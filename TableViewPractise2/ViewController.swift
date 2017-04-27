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

struct Place {
    let name: String
    let imageURLString: String
    let description: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView?
    
    let places: [Place] = [
        Place(name: "La Rambla", imageURLString: "https://ob9a8415roh4djoj110c31a1-wpengine.netdna-ssl.com/wp-content/uploads/2013/05/la-rambla-bcn.jpg", description: "La Rambla is a street in central Barcelona, popular with tourists and locals alike. A tree-lined pedestrian mall, it stretches for 1.2 kilometres connecting Plaça de Catalunya in the centre with the Christopher Columbus Monument at Port Vell."),
        Place(name: "Sagrada Família", imageURLString: "http://static4.businessinsider.com/image/564118d469bedd4f5e8c0052-1190-625/after-133-years-of-construction-the-sagrada-familia-is-finally-almost-done.jpg", description: "The Basílica i Temple Expiatori de la Sagrada Família is a large Roman Catholic church in Barcelona, designed by Catalan architect Antoni Gaudí."),
        Place(name: "Park Güell", imageURLString: "http://www.dciny.org/wp-content/uploads/2015/04/Barcelona-image-1.jpg", description: "The Park Güell is a public park system composed of gardens and architectonic elements located on Carmel Hill, in Barcelona, Catalonia. Carmel Hill belongs to the mountain range of Collserola – the Parc del Carmel is located on the northern face."),
        Place(name: "Gothic Quarter", imageURLString: "http://www.mylocaltrip.com/media/catalog/product/b/a/barcelona_picasso_tour3380_87743.jpg", description: "The Gothic Quarter is the center of the old city of Barcelona. It stretches from La Rambla to Via Laietana, and from the Mediterranean seafront to Ronda de Sant Pere. It is a part of Ciutat Vella district."),
        Place(name: "Casa Milà", imageURLString: "http://www.aviewoncities.com/img/barcelona/kvesp0149s.jpg", description: "Casa Milà, popularly known as La Pedrera or 'open quarry', a reference to its unconventional rough-hewn appearance, is a modernist building in Barcelona, Catalonia, Spain."),
        Place(name: "Casa Batlló", imageURLString: "http://static.thousandwonders.net/Casa.Batlló.original.15425.jpg", description: "Casa Batlló is a renowned building located in the center of Barcelona and is one of Antoni Gaudí’s masterpieces. A remodel of a previously built house, it was redesigned in 1904 by Gaudí and has been refurbished several times after that."),
        Place(name: "Montjuïc", imageURLString: "http://www.planetware.com/photos-large/E/montjuic-0.jpg", description: "Montjuïc is a hill in Barcelona, Catalonia, Spain."),
        Place(name: "Camp Nou", imageURLString: "http://www.hotelmadanis.com/wp-content/uploads/2016/12/Camp-Nou-Madanis.jpg", description: "Camp Nou is a football stadium in Barcelona, Catalonia, Spain. It has been the home of FC Barcelona since its completion in 1957."),
        Place(name: "La Boqueria", imageURLString: "https://jumpwhenisay.files.wordpress.com/2012/04/dsc_0716.jpg", description: "The Mercat de Sant Josep de la Boqueria, often simply referred to as La Boqueria [ɫa bɔkəˈɾiə], is a large public market in the Ciutat Vella district of Barcelona, Catalonia, Spain."),
        Place(name: "Passeig de Gràcia", imageURLString: "http://bonavidabcn.com/wp-content/uploads/2015/10/Passeig-de-Gracia2.jpg", description: "Passeig de Gràcia is one of the major avenues in Barcelona and one of its most important shopping and business areas, containing several of the city's most celebrated pieces of architecture."),
    ]
    
    @IBOutlet var placeImage: UITableView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarcelonaCell", for: indexPath)
        
        if let barcelonaCell = cell as? BarcelonaCell {
            let place = places[indexPath.row]
            barcelonaCell.configure(withPlace: place)
        }
    
        return cell
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: ViewController2.storyBoardID) as! ViewController2
        nextVC.input = places[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func registerTableViewCells() {
//        let nib = UINib(nibName: "BarcelonaCell", bundle: nil)
//        tableView?.register(nib, forCellReuseIdentifier: "BarcelonaCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableViewCells()
    }
    
}
