//
//  BViewController.swift
//  testDeinit
//
//  Created by ming zhou on 2024/5/25.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("😄" + "释放")

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.dismiss(animated: true)
    }

}
