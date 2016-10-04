//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by Mihail Șalari on 10/4/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    /// TapGestureRecognizer
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    /// Button and label
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var buttonLabel: UILabel!
    
    /// Slider and ProgressView
    @IBOutlet weak var slider: UISlider!
    @IBOutlet var progressView: UIProgressView!
    
    /// SegmentedControll and label
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var segmentedControllLabel: UILabel!
    
    /// DatePicker and Label
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerlabel: UILabel!
    
    /// TextView and TextViewLabel
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewlabel: UILabel!
    
    /// TextField and label
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldLabel: UILabel!
    
    /// Switch and activityIndicatorView
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    
    /// Stepper and label
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperlabel: UILabel!
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter
    }()
    
    let disposebag = DisposeBag()
//    let textFieldText = Variable("")
//    let buttonSubject = PublishSubject<String>()
    
    
    // MARK: - LyfeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        textField.rx.text.bindTo(textFieldText).addDisposableTo(disposebag)
//        textFieldText.asObservable().subscribe(onNext: {
//            print($0)
//        }).addDisposableTo(disposebag)
//        
//        ///
//        button.rx.tap.map{ "Hello" }.bindTo(buttonSubject).addDisposableTo(disposebag)
//        buttonSubject.asObservable().subscribe(onNext: {
//            print($0)
//        }).addDisposableTo(disposebag)
        
        
        /// 1
        self.textFieldUI()
        
        /// 2
        self.tapgestureUI()
        
        /// Text View
        textViewUI()
        
        /// Button
        buttonUI()
        
        /// Slider
        sliderUI()
        
        /// Segmented
        segmentedUI()
        
        /// picker
        pickerUI()
        
        /// stepper
        stepperUI()
        
        /// activity
        activityUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - TextField + textfieldlabel

extension ViewController {
    
    func textFieldUI() {
        /// long version
//        textField.rx.text.bindNext {
//            self.textFieldLabel.rx.text.onNext($0)
//        }.addDisposableTo(disposebag)
        
        /// Short version
        textField.rx.text.bindNext {
            self.textFieldLabel.text = $0
            }.addDisposableTo(disposebag)
    }
}


// MARK: - Tap gesture

extension ViewController {
    func tapgestureUI() {
        tapGestureRecognizer.rx.event.asDriver().drive(onNext: { [unowned self] _ in
            self.view.endEditing(true)
        }).addDisposableTo(disposebag)
    }
}

// MARK: - TextView

extension ViewController {
    func textViewUI() {
        textView.rx.text.bindNext {
            self.textViewlabel.text = "Character count = \($0.characters.count)"
            }.addDisposableTo(disposebag)
    }
}


// MARK: - Button

extension ViewController {
    func buttonUI() {
        button.rx.tap.asDriver().drive(onNext: {
            self.buttonLabel.text! += "Hello RxSwift"
            self.view.endEditing(true)
            
            UIView.animate(withDuration: 0.5, animations: { 
                self.view.layoutIfNeeded()
            })
            }).addDisposableTo(disposebag)
    }
}


// MARK: - Slider

extension ViewController {
    func sliderUI() {
        slider.rx.value.asDriver().drive(progressView.rx.progress).addDisposableTo(disposebag)
        
    }
}



// MARK: - SegmentedControll

extension ViewController {
    func segmentedUI() {
        slider.rx.value.asDriver().skip(1).drive(onNext: { _ in
            self.segmentedControllLabel.text = "Selected segment = '($0)"
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }).addDisposableTo(disposebag)
    }
}



// MARK: - DatePicker

extension ViewController {
    func pickerUI() {
        datePicker.rx.date.asDriver().map {
            self.dateFormatter.string(from: $0)
            }.drive(onNext: {
            self.datePickerlabel.text = "Selected Date = \($0)"
        }).addDisposableTo(disposebag)
    }
}


// MARK: - Stepper

extension ViewController {
    func stepperUI() {
        stepper.rx.value.asDriver().map { String(Int($0))}.drive(stepperlabel.rx.text).addDisposableTo(disposebag)
    }
}


// MARK: - Activity

extension ViewController {
    func activityUI() {
        mySwitch.rx.value.asDriver().map { !$0 }.drive( myActivityIndicatorView.rx.hidden).addDisposableTo(disposebag)
        mySwitch.rx.value.asDriver().drive(myActivityIndicatorView.rx.animating).addDisposableTo(disposebag)
    }
}

















