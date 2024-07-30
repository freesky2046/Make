//
//  ViewController.swift
//  递归和非递归锁
//
//  Created by ming zhou on 2024/7/30.
//

import UIKit

class ViewController: UIViewController {

    var index: Int = 0
    var recursivelock: NSRecursiveLock = NSRecursiveLock()
    var lock: NSLock = NSLock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        changeIndexone()
        print("😄" + "index")

    }
    
    func changeIndexone() {
        recursivelock.lock()
        index += 1
        if index < 10 {
            changeIndexone()
        }
        recursivelock.unlock()
    }

    // 会死锁
    func changeIndextwo() {
        lock.lock()
        index += 1
        if index < 10 {
            changeIndextwo()
        }
        lock.unlock()
    }

}

