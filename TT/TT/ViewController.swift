//
//  ViewController.swift
//  TT
//
//  Created by ming zhou on 2024/6/19.
//

import UIKit

class ViewController: UIViewController {

    
    private var statusBarStyle: UIStatusBarStyle = .darkContent
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            print("😄" + "改变")

            self.statusBarStyle = .lightContent
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }


    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        print("😄" + "执行")
         return statusBarStyle
    }
    
}

