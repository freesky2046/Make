//
//  NSOperationViewController.swift
//  OperationDemo
//
//  Created by 周明 on 2024/5/2.
//

import UIKit

class NSOperationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        onlyOneBlock()
        mutilBlock()
        
    }
    
    
    // 当前线程，同步执行。
    func onlyOneBlock() {
        let blockOperation: BlockOperation = BlockOperation()
        blockOperation.addExecutionBlock {
            print("block \(Thread.current)")
        }
        print("before start")
        blockOperation.start()
        print("after start")
//      log 如下
//        before start
//        block <_NSMainThread: 0x60000170c000>{number = 1, name = main}
//        after start
    }
    
    func mutilBlock() {
//        let blockOperation: BlockOperation = BlockOperation()
//        blockOperation.addExecutionBlock {
//            Thread.sleep(forTimeInterval: 10)
//            print("block1 \(Thread.current)")
//        }
//        blockOperation.addExecutionBlock {
//            Thread.sleep(forTimeInterval: 2)
//
//            print("block2 \(Thread.current)")
//        }
//        blockOperation.addExecutionBlock {
//            Thread.sleep(forTimeInterval: 2)
//
//            print("block3 \(Thread.current)")
//        }
//        blockOperation.addExecutionBlock {
//            Thread.sleep(forTimeInterval: 2)
//
//            print("block4 \(Thread.current)")
//        }
        print("before start")
//        DispatchQueue.async()
//        DispatchQueue.async(dispatch_get_main_queue())
//        blockOperation.start()
        print("after start")
    }
    



}
