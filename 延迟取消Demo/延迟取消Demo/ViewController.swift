//
//  ViewController.swift
//  延迟取消Demo
//
//  Created by ming zhou on 2024/7/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      

        
    }

    @IBAction func btnAction(_ sender: Any) {

        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(log), object: nil)
        perform(#selector(log), with: nil, afterDelay: 0.8)
    }
    
    @objc func log() {
        print("😄" + "被点击")
    }
    
}

