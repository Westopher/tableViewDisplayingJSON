//
//  ViewController.swift
//  tableViewDisplayingJSON
//
//  Created by West Kraemer on 2/15/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var weatherList: [weatherJSON] = []
    
    
    func downloadJSON() {
        let jsonUrlString = "https://api.darksky.net/forecast/59c6b6b7efd5c3fc0f617338cfae6c48/40.7309,-73.9872"
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            
            do {
                let JSON = try JSONDecoder().decode(weatherJSON.self, from: data)
                self.weatherList.append(JSON)
                print(self.weatherList)
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
            
            }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
        
}
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! countryCell
        
        
        cell.nameLabel?.text = String(weatherList[indexPath.row].currently!.cloudCover!)
        
        
        return cell
    }
}
    
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue1", sender: nil)
    }
    }
    
    

