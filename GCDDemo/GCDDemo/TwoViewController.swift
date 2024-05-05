//
//  TwoViewController.swift
//  GCDDemo
//
//  Created by 周明 on 2024/5/4.
//

import UIKit

class TwoViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
        for _ in 0..<2 {
            // 任务会在提交任务所在的线程上执行：这里就是主线程
            syncSerialQueue()
        }
        
        
        print("\n\n\n\n")
        let queue = DispatchQueue.global(qos: .default)
        queue.async {
            for _ in 0..<2 {
                // 任务会在提交任务所在的线程上执行：这里是系统为这个内置并行队列分配一个线程上执行
                self.syncSerialQueue()
            }
        }
    
    }
    
    

    func syncSerialQueue() {
        let serialQueue = DispatchQueue(label: "com.example.serialQueue")
        print("提交前\(Thread.current)")
        
        serialQueue.sync {
            print(" 同步提任务1到自定义串行队列")
            print("\(Thread.current)")
        }
        print(" 提交后")
        
    }
    

}
