//: Playground - noun: a place where people can play

import RxSwift
import UIKit

//example("without observeon") {
//    _ = Observable.of(1, 2, 3)
//        .subscribe(onNext: {
//            print("\(Thread.current): ", $0)
//            }, onError: {
//                print($0)
//            }, onCompleted: {
//                print("Completed")
//            }, onDisposed: {
//                print("onDisposed")
//        })
//}
//
//
//example("observeOn") { 
//    _ = Observable.of(1, 2, 3)
//        .observeOn(ConcurrentDispatchQueueScheduler(globalConcurrentQueueQOS: .background))
//        .subscribe(onNext: {
//            print("\(Thread.current): ", $0)
//            }, onError: {
//                print($0)
//            }, onCompleted: {
//                print("Completed")
//            }, onDisposed: {
//                print("onDisposed")
//        })
//}

/*
 ---Example of: without observeon ---
 <NSThread: 0x60000007c240>{number = 1, name = main}:  1
 <NSThread: 0x60000007c240>{number = 1, name = main}:  2
 <NSThread: 0x60000007c240>{number = 1, name = main}:  3
 Completed
 onDisposed
 
 ---Example of: observeOn ---
 <NSThread: 0x61800007ed00>{number = 4, name = (null)}:  1
 <NSThread: 0x61800007ed00>{number = 4, name = (null)}:  2
 <NSThread: 0x61800007ed00>{number = 4, name = (null)}:  3
 Completed
 */

example("SubscribeOn and observeOn") {
    
    let queue1 = DispatchQueue.global(qos: .default)
    let queue2 = DispatchQueue.global(qos: .default)
    
    print("\(Thread.current)")
    
    _ = Observable<Int>.create({ (observer) -> Disposable in
        print("Observable thread: \(Thread.current)")
        
        // generate
        observer.on(.next(1))
        observer.on(.next(2))
        observer.on(.next(3))
        
        return Disposables.create()
    }).subscribeOn(SerialDispatchQueueScheduler(internalSerialQueueName: "queue1")).subscribeOn(SerialDispatchQueueScheduler(internalSerialQueueName: "queue2")).subscribe(onNext: {
        print("Observable thread: \(Thread.current)", $0)
    })
    
    
    
    
    
    
    
    
}
