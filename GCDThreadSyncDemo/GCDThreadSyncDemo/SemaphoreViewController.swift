//
//  SemaphoreViewController.swift
//  GCDThreadSyncDemo
//
//  Created by ming zhou on 2024/5/11.
//

import UIKit

class SemaphoreViewController: UIViewController {
    
    let semaphore =  DispatchSemaphore(value: 1)

    
    var i: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        

        

        
    }
    
    func writeSomething() {
   
        i = i + 1
        print("😄" + "i:\(i)")
       
    }
    


}
