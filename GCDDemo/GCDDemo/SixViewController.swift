//
//  SixViewController.swift
//  GCDDemo
//
//  Created by 周明 on 2024/5/5.
//

import UIKit

class SixViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        asyncConcurrent()
        
        
    }
    
    func asyncConcurrent() {
        let queue = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)
        for _ in 0..<1000 {
            queue.async {
                var j = 0
                for i in 0..<1000 {
                    j += 1
                }
                print("异步提交到并行队列\(Thread.current)")
            }
        }
    }

}
