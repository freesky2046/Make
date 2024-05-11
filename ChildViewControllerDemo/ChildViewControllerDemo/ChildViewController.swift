//
//  ChildViewController.swift
//  ChildViewControllerDemo
//
//  Created by 周明 on 2024/5/11.
//

import UIKit

class ChildViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("😄" + "viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("😄" + "viewDidAppear")
        print("😄" + "view.frame:\(view.frame)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("😄" + "viewWillAppear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("😄" + "viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("😄" + "viewWillDisappear")

    }
}
