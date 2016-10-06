//
//  AnimatedSectionModel.swift
//  RxSwiftTest
//
//  Created by Mihail Șalari on 10/6/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

struct AnimatedSectionModel {
    
    // MARK: - Properties
    
    let title: String
    var data: [String]
}


// MARK: - AnimatableSectionModelType

extension AnimatedSectionModel: AnimatableSectionModelType {
    
    typealias Item = String
    typealias Identity = String
    
    var identity: Identity {
        return title
    }
    
    var items: [Item] {
        return data
    }
    
    init(original: AnimatedSectionModel, items: [String]) {
        self = original
        data = items
    }
}
