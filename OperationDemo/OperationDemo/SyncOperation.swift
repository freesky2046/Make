//
//  SyncOperation.swift
//  OperationDemo
//
//  Created by 周明 on 2024/5/6.
//

import UIKit

class SyncOperation: Operation {

    override func main() {
        if isCancelled {
            return
        }
        for i in 0..<1000 {
//            print("\(i * 2)")
        }
        print(" 执行完毕")
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
        print("start:\(Thread.current)")
        isExecuting = true
        isFinished = false
        guard let data = try? Data(contentsOf: URL(string: url ?? "")!) else {
            markCompletion()

            return
        }
        self.image = UIImage(data: data)
        markCompletion()
    }
    
    func markCompletion() {
        isExecuting = false
        isFinished = true
        completionBlock?()
    }
}
