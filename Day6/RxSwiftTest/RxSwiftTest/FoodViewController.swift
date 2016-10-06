//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by Mihail Șalari on 10/4/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class FoodViewController: UITableViewController {
    
    // MARK: - Properties
    
    let food = [
        Food(name: "Kids-burger", flickrID: "kids-burger"),
        Food(name: "Lasanga", flickrID: "lasanga"),
        Food(name: "Sausage", flickrID: "sausage"),
        Food(name: "Vegetables", flickrID: "vegetables")
    ]
    
    
    // MARK: - LyfeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - Data source

extension FoodViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let item = food[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.flickrID
        cell.imageView?.image = item.image
        
        return cell
    }
}


extension FoodViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected food \(food[indexPath.row])")
    }
}












