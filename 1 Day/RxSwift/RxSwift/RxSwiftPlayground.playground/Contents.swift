//: Playground - noun: a place where people can play

import RxSwift

example("Test") { 
    //--1---2---3---|--> // observable      | - observale ends good
    //----d--ff--f---x-> // data strings    x - observable ends with error
    
    let intObservable = Observable.just(30)
    let stringObservable = Observable.just("Hello")
    
}

//example("Just") { 
//    /// Create observable
//    
//    let observable = Observable.just("Hello RxSwift")
//    
//    
//    // Create observer
//    observable.subscribe { (event) in
//        print(event)
//    }
//}

//example("of") { 
//    // Operator "of"
//    let observable = Observable.of(1, 2, 3, 4, 5)
//    observable.subscribe({ (event) in
//        print(event)
//    })
//    
//    observable.subscribe {
//        print($0)
//    }
//}
//
//example("Create") { 
//    // Operator create
//    let items = [1, 2, 3, 4, 5]
//    Observable.from(items).subscribe(onNext: { (event) in // cold observable, exist and a hot observable
//        print(event)
//        }, onError: { (error) in
//            print(error)
//        }, onCompleted: { 
//            print("Ok")
//        }, onDisposed: { 
//            print("Disposed")
//    })
//}
//
//example("Disposable") { 
//    let seq = [1, 2, 3]
//    Observable.from(seq).subscribe({ (event) in
//        print(event)
//    })
//    Disposables.create() // when we want t stop event
//}

//example("Dispose") { 
//    let seq = [1, 2, 3]
//    let subsription = Observable.from(seq)
//    subsription.subscribe({ (event) in
//        print(event)
//    }).dispose() // when we want t stop event, this is bad practice
//}

//example("DisposeBag") { 
//    let disposeBag = DisposeBag()
//    let seq = [1, 2, 3]
//    let subsription = Observable.from(seq)
//    subsription.subscribe({ (event) in
//        print(event)
//    }).addDisposableTo(disposeBag) // clean memory manualy
//}
//
//
//
//example("takeUntil") {
//    let stopSeq = Observable.just(1).delay(2, scheduler: MainScheduler.instance)
//    let seq = Observable.of(1, 2, 3, 4, 5).takeUntil(stopSeq)
//    seq.subscribe {
//        print($0)
//    }
//}


//example("Filter") { 
//    let seq = Observable.of(1, 2, 3, 40, 57, 99).filter { $0 > 10 }
//    seq.subscribe({ (event) in
//        print(event)
//    })
//}

//example("map") { 
//    let seq = Observable.of(1, 2, 3, 40, 57, 99).map { $0 * 10 }
//    seq.subscribe({ (event) in
//        print(event)
//    })
//}

example("merge") {
    let firstSeq = Observable<Any>.of(1, 2, 3)
    let secondSeq = Observable<Any>.of("a", "b", "c")
    let bothSeq = Observable.of(firstSeq, secondSeq)
    let mergeBoth = bothSeq.merge()
    mergeBoth.subscribe {
        print($0)
    }
}







