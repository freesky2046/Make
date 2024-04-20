//
//  ChildVCLifeCycleViewController.swift
//  ChildViewControllerTipsDemo
//
//  Created by ming zhou on 2024/4/20.
//

import UIKit

class ChildVCLifeCycleViewController: UIViewController {

    var containerView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        containerView.backgroundColor = .green.withAlphaComponent(0.7)
        containerView.frame = CGRectMake(0, 300, UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height -  500)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.addChildViewController()
        })
        
    }
    
    
    func addChildViewController() {


        let child = ChildViewController()
        self.addChild(child)
        containerView.addSubview(child.view)
    }

}


class ChildViewController : UIViewController {
    
    override func viewDidLoad() {
        print("😄" + "viewDidLoad")
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("😄" + "viewDidAppear")
        super.viewDidAppear(animated)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("😄" + "viewWillAppear")
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("😄" + "viewWillDisappear")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("😄" + "viewDidDisappear")

        super.viewDidDisappear(animated)

    }
}
