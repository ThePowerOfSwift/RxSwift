//
//  FoodCollectionViewController.swift
//  RxSwiftTest
//
//  Created by Mihail Șalari on 10/6/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

let reuseIdentifier = "FoodCell"
let headerReuseIdentifier = "HeaderCell"

class FoodCollectionViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addBarButtonitem: UIBarButtonItem!
    @IBOutlet weak var longPressGR: UILongPressGestureRecognizer!
    
    let disposeBag = DisposeBag()
    let dataSource = RxCollectionViewSectionedAnimatedDataSource<AnimatedSectionModel>()
    
    let data = Variable([
            AnimatedSectionModel(title: "Section 0", data: ["0-0"])
        ])
        
    
    
    // MARK: - LyfeCicle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource.configureCell = {_, collectionView, indexPath, title in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FoodCollectionViewCell
            cell.titleLabel.text = title
            return cell
        }
        
        dataSource.supplementaryViewFactory = {dataSource, collectionView, kind, indexPath in
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! FoodCollectionReusableView
            
            header.titleLabel.text = "Section: \(self.data.value.count)"
            return header
        }
        
        data.asDriver().drive(collectionView.rx.items(dataSource: dataSource)).addDisposableTo(disposeBag)
        
        addBarButtonitem.rx.tap.asDriver().drive(onNext: {
            let section = self.data.value.count
            let items: [String] = {
                var items = [String]()
                let random = Int(arc4random_uniform(5)) + 1
                (0...random).forEach {
                    items.append("\(section)-\($0)")
                }
                return items
            }()
            
            self.data.value += [AnimatedSectionModel(title: "Section: \(section)", data: items)]
        }).addDisposableTo(disposeBag)
        
        longPressGR.rx.event.subscribe(onNext: {
            switch $0.state {
            case .began:
                guard let selectedIndexPath = self.collectionView.indexPathForItem(at: $0.location(in: self.collectionView)) else { break }
                self.collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
            case .changed:
                self.collectionView.updateInteractiveMovementTargetPosition($0.location(in: $0.view!))
            case .ended:
                self.collectionView.endInteractiveMovement()
            default:
                self.collectionView.cancelInteractiveMovement()
            }
        }).addDisposableTo(disposeBag)
    }
}
































