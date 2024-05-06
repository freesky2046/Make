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
            print("\(i * 2)")
        }
        print(" 执行完毕")
    }
}


class AsyncOperation: Operation {
    
    override func start() {
        
    }
}
