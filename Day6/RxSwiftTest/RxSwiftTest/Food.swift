//
//  Food.swift
//  RxSwiftTest
//
//  Created by Mihail Șalari on 10/6/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

struct Food {
    
    // MARK: - Properties
    
    let name: String
    let flickrID: String
    var image: UIImage?
    
    
    // MARK: - Initializers
    
    init(name: String, flickrID: String) {
        self.name = name
        self.flickrID = flickrID
        image = UIImage(named: flickrID)
    }
}


// MARK: - CustomStringConvertible

extension Food: CustomStringConvertible {
    
    var description: String {
        return "\(name): flickr.com/\(flickrID)"
    }
}
