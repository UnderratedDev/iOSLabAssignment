//
//  MasterViewController.swift
//  LabAssignment
//
//  Created by Yudhvir Raj on 2017-12-01.
//  Copyright © 2017 Yudhvir Raj. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    private let reuseIdentifier = "CellFilm"
    // var objects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        // print (AppDelegate.films.count)
        for i in 1...7 {
            getJSON(urlString: "https://swapi.co/api/films/\(i)")
        }
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = AppDelegate.films[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object.opening_crawl
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.films.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell

        let object = AppDelegate.films[indexPath.row]
        // cell.textLabel!.text = object.description
        cell.title.text = object.title
        
        // print (cell.title.text)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    func getJSON(urlString: String) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error ?? "")
            } else {
                do {
                    // let response = try JSONSerialization.jsonObject(with: data!, options: [])
                    // let objStr = self.notPrettyString(from: response)
                    // print (objStr)
                    if let response = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                        
                        // print (response)
                        
                        // print(array) // ==> ["MacBook 2015", "iPhone 6s"]
                        // for item in response {
                        // print (item)
                        // }
                        
                        let film = Film ()
                        
                        if let title = response["title"] as? String {
                            film.title = title
                        }
                        
                        if let episode_id = response["episode_id"] as? String {
                            film.episode_id = episode_id
                        }
                        
                        // access individual value in dictionary
                        if let url = response["url"] as? String {
                            film.url = url
                        }
                        
                        if let producer = response["producer"] as? String {
                            film.producer = producer
                            // print (film.producer)
                        }
                        
                        if let opening_crawl = response["opening_crawl"] as? String {
                            film.opening_crawl = opening_crawl
                        }
                        
                        if let director = response["director"] as? String {
                            film.director = director
                        }
                        
                        if let release_date = response["release_date"] as? String {
                            film.release_date = release_date
                        }
                        
                        if let planets = response["planets"] as? [String] {
                            film.planets = planets
                        }
                        
                        if let starships = response["starships"] as? [String] {
                            film.starships = starships
                        }
                        
                        if let vehicles = response["vehicles"] as? [String] {
                            film.vehicles = vehicles
                        }
                        
                        if let species = response["species"] as? [String] {
                            film.species = species
                        }
                        
                        if let species = response["species"] as? [String] {
                            film.species = species
                        }
                        
                        if let created = response["created"] as? String {
                            film.created = created
                        }
                        
                        if let edited = response["edited"] as? String {
                            film.edited = edited
                        }
                        
                        // let card:Card = Card (json:)
                        // let film = Film()
                        
                        // print (film.edited)
                        
                        AppDelegate.films.append (film)
                        
                        print (AppDelegate.films.count)
                        
                        // print (card)
                        
                        // self.tableView?.reloadData()
                        DispatchQueue.main.sync {
                            self.tableView?.reloadData()
                        }
                        
                    }  else {
                        print("bad json")
                    }
                    
                    // self.successGetTermsData(response: response)
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
        
    }

}

