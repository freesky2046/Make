//
//  AnimationDemoViewController.swift
//  AnimationDemo
//
//  Created by 周明 on 2024/4/8.
//

import UIKit

class AnimationDemoViewController: UIViewController {

    private var redView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.redView = UIView(frame: CGRect(x: 0, y: 88, width: 44, height: 44))
        redView.backgroundColor = .red
        view.addSubview(redView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse]) { [weak self] in
            self?.redView.frame = CGRect(x: 0, y: 188, width: 44, height: 44)
        }
    

    }
    
    


}
