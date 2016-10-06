//
//  FoodRxViewController.swift
//  RxSwiftTest
//
//  Created by Mihail Șalari on 10/6/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FoodRxViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    /// #1 Create observable of food array
    
    let food = Observable.just([
        Food(name: "Kids-burger", flickrID: "kids-burger"),
        Food(name: "Lasanga", flickrID: "lasanga"),
        Food(name: "Sausage", flickrID: "sausage"),
        Food(name: "Vegetables", flickrID: "vegetables")
    ])
    
    let disposeBag = DisposeBag()
    
    
    // MARK: - LyfeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /// #2 Chain elements array with table view
        
        food.bindTo(tableView.rx.items(cellIdentifier: reuseIdentifier)) { row, item, cell in
        
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = item.flickrID
            cell.imageView?.image = item.image
            
        }.addDisposableTo(disposeBag)
        
        tableView.rx.modelSelected(Food.self).subscribe(onNext: {
            print("You selected \($0)")
        }).addDisposableTo(disposeBag)
    }
}
