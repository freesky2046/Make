//
//  OneViewController.swift
//  GCDDemo
//
//  Created by 周明 on 2024/5/3.
//

import UIKit

// 同步提交到主队列（主线程上提交或非主线程上提交）
class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        mainThreadmainQueueTask() // 死锁
        subThreadmainQueueTask()
        
        
    }
    
    func mainThreadmainQueueTask() {
        let mainQueue = DispatchQueue.main
        print("start: \(Thread.current)")
        mainQueue.sync {
            print("主线程上同步提一个任务到主队列\(Thread.current)")
        }
        print("end")
    }
    
    func subThreadmainQueueTask() {
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.async {
            self.mainThreadmainQueueTask()
        }
    }
}
