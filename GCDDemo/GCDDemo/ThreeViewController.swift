//
//  ThreeViewController.swift
//  GCDDemo
//
//  Created by 周明 on 2024/5/4.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        for _ in 0..<10 {
            syncConcurrentQueue()
        }
 
    }

    func syncConcurrentQueue() {
        let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
        print("提交前")
        concurrentQueue.sync {
            print("同步到并行队列")
            print("\(Thread.current)")
        }
        print("提交后\n")
    }
}
