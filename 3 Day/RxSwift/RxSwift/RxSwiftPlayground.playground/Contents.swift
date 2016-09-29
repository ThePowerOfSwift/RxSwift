//: Playground - noun: a place where people can play

import RxSwift

example("Side Effect") {
    
    //------1---2---3---|-->    Source Observable
    //      |   |   |
    //  doOn{_ in action() } -> Operator
    //      |   |   |
    //      ↓   ↓   ↓
    //------1---2---3---|-->    Result Observable
    
    // doOnNext
    // doOnError
    // doOnComplete
    
    let disposableBag = DisposeBag()
    
    let seq = [0, 32, 300, 100, -40]
    let tempSeq = Observable.from(seq)
    
    tempSeq.do(onNext: {
        print(" \($0)F = ", terminator: "")
        
    }).map({
        Double($0 - 32) * 5 / 9.0
    }).subscribe(onNext: {
        print(String(format: "%.1f", $0))
    }).addDisposableTo(disposableBag)
}
