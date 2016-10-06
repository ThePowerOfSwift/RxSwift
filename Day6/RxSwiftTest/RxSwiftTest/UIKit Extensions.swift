//
//  UIKit Extensions.swift
//  RxSwiftTest
//
//  Created by Mihail Șalari on 10/6/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

extension String {
    public typealias Identity = String
    
    public var identity: Identity {
        return self
    }
}
