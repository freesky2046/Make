//
//  ViewController.swift
//  LockDemo
//
//  Created by ming zhou on 2024/5/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let operationQueue = OperationQueue()
        operationQueue.qualityOfService = .default
        let operation1 = AsyncOperation()
        
        operationQueue.addOperation(operation1)
        
        let operation2 = AsyncOperation()
        operation2.qualityOfService = .userInitiated
        operationQueue.addOperation(operation2)
        
        for i in 0..<1000 {
            print("😄" + "Thread:\(Thread.current)")
        }

    }


}

class AsyncOperation: Operation {
    
    var _isExecuting: Bool = false
    var _isFinished: Bool = false
    var url:String?
    var lock: NSRecursiveLock = NSRecursiveLock()
    var image: UIImage?
    
    override var isExecuting: Bool {
        get {
            lock.lock()
            let result = _isExecuting
            lock.unlock()
            return result
        }
        set {
            lock.lock()
            willChangeValue(forKey: "isExecuting")
            _isExecuting = newValue
            didChangeValue(forKey: "isExecuting")
            lock.unlock()
        }
    }
    
    override var isFinished: Bool {
        get {
            lock.lock()
            let result = _isFinished
            lock.unlock()
            return result
        }
        set {
            lock.lock()
            willChangeValue(forKey: "isFinished")
            _isFinished = newValue
            willChangeValue(forKey: "isFinished")
            lock.unlock()
        }
    }
    
    override init() {
        super.init()
    }
    
    override func start() {
        if isCancelled == true {
            markCompletion()
            return
        }
        
        isExecuting = true
        isFinished = false
        for i in 0..<1000 {
            print("😄" + "Thread:\(Thread.current)")
        }

//        guard let data = try? Data(contentsOf: URL(string: url ?? "")!) else {
//            markCompletion()
//            return
//        }
//        self.image = UIImage(data: data)
        markCompletion()
    }
    
    func markCompletion() {
        isExecuting = false
        isFinished = true
        completionBlock?()
    }
}
