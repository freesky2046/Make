//
//  FifthViewController.swift
//  GCDDemo
//
//  Created by 周明 on 2024/5/5.
//

import UIKit

class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        asyncSerialQueue()
        
        
    }
    
    func asyncSerialQueue() {
        let queue = DispatchQueue(label: "com.example.serialQueue")
        print("提交前 1")
        queue.async {
            print("异步提交串行队列")
            print("\(Thread.current)")
        }
        print("提交后 1")

        
        print("提交前  2")
        queue.async {
            print("异步提交串行队列")
            print("\(Thread.current)")
        }
        print("提交后  2")

        
        let queue2 = DispatchQueue.global(qos: .default)
        queue2.async {
            print("提交前 3")
            queue.async {
                print("异步提交串行队列")
                print("\(Thread.current)")
            }
            print("提交后 3")
        }
    }



}
