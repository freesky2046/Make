//
//  CAAnimationDemoViewController.swift
//  AnimationDemo
//
//  Created by 周明 on 2024/4/9.
//

import UIKit

class CAAnimationDemoViewController: UIViewController {

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
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.fromValue = 88 + 22
        animation.toValue = 188 + 22
        animation.autoreverses = true
        animation.duration = 2.0
        animation.repeatCount = Float.greatestFiniteMagnitude
        animation.isRemovedOnCompletion =  false
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        redView.layer.add(animation, forKey: "animKey")
    }
    
}
