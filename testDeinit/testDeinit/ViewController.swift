//
//  ViewController.swift
//  testDeinit
//
//  Created by ming zhou on 2024/5/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let b = BViewController()
        let bNav = UINavigationController(rootViewController: b)
        bNav.modalPresentationStyle = .overFullScreen
        self.present(bNav, animated: true)
    }
}

