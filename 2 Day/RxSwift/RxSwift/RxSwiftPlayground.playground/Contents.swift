//: Playground - noun: a place where people can play

import RxSwift

//example("PublishSubject") { 
//    let disposableBag = DisposeBag()
//    let subject = PublishSubject<String>()
//    
//    subject.subscribe {
//        print("Subscribtion first: ", $0)
//    }.addDisposableTo(disposableBag)
//    
//    subject.on(.next("Hello"))
////    subject.onCompleted() // cancel
//    subject.onNext("RxSwift")
//    
//    subject.subscribe(onNext: {
//        print("Subscribtion second: ", $0)
//    }).addDisposableTo(disposableBag)
//    
//    enum ErrorType: Error {
//        case test
//    }
//    
////    subject.onError(ErrorType.test) // cancel
//    
//    subject.onNext("Hi")
//    subject.onNext("Mike")
//}


//example("BehaviorSubject") { 
//    let disposableBag = DisposeBag()
//    let subject = BehaviorSubject(value: 1) // [1]
//    
//    let firstSubsription = subject.subscribe(onNext: {
//        print("--- line \(#line) --- Value ->", $0)
//    }).addDisposableTo(disposableBag)
//    
//    subject.onNext(2) // [1, 2]
//    subject.onNext(3) // [1, 2, 3]
//    
//    
//    let secondSubscription = subject.map({ $0 + 2}).subscribe(onNext: {
//         print("--- line \(#line) --- Value ->", $0) // [3], here is the last element, but value += 2
//    }).addDisposableTo(disposableBag)
//}


//example("ReplaySubject") {  // Cache data
//    let disposableBag = DisposeBag()
//    let subject = ReplaySubject<Int>.create(bufferSize: 3)
//    
//    subject.subscribe({ (event) in
//        print("--- line \(#line) First  Subscription --- Value ->", event)
//    }).addDisposableTo(disposableBag)
//    
//    subject.onNext(2)
//    subject.onNext(3)
//    
//    
//    subject.subscribe {
//        print("--- line \(#line) Second Subscription --- Value ->", $0)
//    }.addDisposableTo(disposableBag)
//    
//    
//    subject.onNext(4)
//    subject.onNext(5))
//}

example("Variables") { // nedd initializer, not keep data
    let disposableBag = DisposeBag()
    let subject = Variable("A")
    
    subject.asObservable().subscribe(onNext: {
        print("--- line \(#line) First  Subscription --- Value ->", $0)
    }).addDisposableTo(disposableBag)
    
    subject.value = "B"
}





