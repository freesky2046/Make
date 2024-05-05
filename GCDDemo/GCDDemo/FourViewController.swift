//
//  FourViewController.swift
//  GCDDemo
//
//  Created by 周明 on 2024/5/5.
//

import UIKit

// 异步提交到主队列
class FourViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("提交前")
        asyncMainQueue("主线程上异步提交任务到主队列")
        print("提交后")
        
        asyncMainQueueOnNotMainThread("子线程上异步提交任务到主队列")
        
    }
    
    
    
    func asyncMainQueue(_ msg: String) {
        let queue = DispatchQueue.main
        queue.async {
            print(msg)
            print("\(Thread.current)")
        }
    }
    
    func asyncMainQueueOnNotMainThread(_ msg: String) {
        let defualtQueue = DispatchQueue.global(qos: .default)
        defualtQueue.async {
            print("提交前\(Thread.current)")
            self.asyncMainQueue(msg)
            print("提交后\(Thread.current)")
        }
    }
    



}
