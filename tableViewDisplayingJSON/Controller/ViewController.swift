//
//  ViewController.swift
//  tableViewDisplayingJSON
//
//  Created by West Kraemer on 2/15/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

struct DarkSky: Decodable {
    
    var currently : String?
    var daily : String
    var flags : String
    var hourly : String
    var latitude : Float
    var longitude : Float
    var minutely : String
    var offset : Int
    var timezone : String
    
}

var countries = ["USA", "Canada", "Norway", "South Africa", "Germany", "Austria"]

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! countryCell
        //cell.nameLabel?.text = countries[indexPath.row]
        
        let jsonUrlString = "https://api.darksky.net/forecast/59c6b6b7efd5c3fc0f617338cfae6c48/37.8267,-122.4233"
        guard let url = URL(string: jsonUrlString) else {return UITableViewCell()}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            
            do {
                let darksky = try JSONDecoder().decode(DarkSky.self, from: data)
                print(darksky.latitude)
                DispatchQueue.main.async {
                    cell.nameLabel?.text = String(darksky.latitude)
                    
                }
            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
            
            
            
            }.resume()
        return cell
    }
}
    
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue1", sender: nil)
    }
    }
    
    

