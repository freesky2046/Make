//
//  ViewController.swift
//  QueueDemo
//
//  Created by ming zhou on 2024/5/11.
//

import UIKit

class ViewController: UIViewController {

    weak var semaphore: DispatchSemaphore?
    override func viewDidLoad() {
        super.viewDidLoad()
        semaphore = DispatchSemaphore(value: 1)
        
    }


}

