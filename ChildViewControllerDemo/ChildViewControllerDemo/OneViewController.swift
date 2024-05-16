//
//  OneViewController.swift
//  ChildViewControllerDemo
//
//  Created by 周明 on 2024/5/11.
//

import UIKit

class OneViewController: UIViewController {
    let child: ChildViewController = ChildViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(child.view)
    }

}
