//
//  SemaphoreViewController.swift
//  GCDThreadSyncDemo
//
//  Created by ming zhou on 2024/5/11.
//

import UIKit

class SemaphoreViewController: UIViewController {
    
//    let semaphore =  DispatchSemaphore(value: 1)
    let lock = NSLock()
    
    var i: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        
        DispatchQueue.global(qos: .default).async { [weak self] in
        }
        
//        semaphore.wait() // 减为 0 ，依然可以执
        
        lock.lock()
        print("😄" + "\(i)")

        lock.unlock()

        lock.unlock()
    }
    
    func writeSomething() {
   
        i = i + 1
        print("😄" + "i:\(i)")
       
    }
    


}
