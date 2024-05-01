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
        
        addBasicAnimation()
        

    }
    
    private func addBasicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "position.y")
        basicAnimation.fromValue = 88 + 44.0 / 2
        basicAnimation.toValue = 200.0
        basicAnimation.duration = 1.0
        basicAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        redView.layer.add(basicAnimation, forKey: "")
    }
    
    


}
