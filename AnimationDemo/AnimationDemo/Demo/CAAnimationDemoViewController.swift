//
//  CAAnimationDemoViewController.swift
//  AnimationDemo
//
//  Created by 周明 on 2024/4/9.
//

import UIKit

class CAAnimationDemoViewController: UIViewController {


    private var redView:UIImageView!
    private var lineView:UIView!
    private var bcakView:UIImageView!
    private var mask:UIView!
    private var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        
        self.bcakView = UIImageView(frame: CGRect(x: 118, y: 88, width: 88, height: 88))
        bcakView.image = UIImage(named: "2")
        view.addSubview(bcakView)

        self.redView = UIImageView(frame: CGRect(x: 118, y: 88, width: 88, height: 88))
        redView.image = UIImage(named: "1.jpg")
        redView.backgroundColor = .red
        mask = UIView()
        mask.backgroundColor = UIColor.black
        // 這邊我們必須設定顏色，否則沒有效果
        mask.frame = CGRect(x: 87, y: 0, width: 1, height: 88)

        redView.mask = mask
        view.addSubview(redView)
        
        
        lineView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 88))
        lineView.backgroundColor = .blue
        mask.addSubview(lineView)
//        lineView = UIView(frame: CGRect(x: 205, y: 88, width: 1, height: 88))
//        lineView.backgroundColor = .red
//        view.addSubview(lineView)
//        
//        label = UILabel(frame: CGRect(x: 0, y: 48, width: 40, height: 40))
//        label.text = "原图"
//        label.textColor = .red.withAlphaComponent(0.7)
//        lineView.addSubview(label)
//        
//        let label2 = UILabel(frame: CGRect(x: -40, y: 48, width: 40, height: 40))
//        label2.text = "原图"
//        label2.textColor = .red.withAlphaComponent(0.7)
//        lineView.addSubview(label2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation()
//        animation()

    }
    
    func animation() {
        let count = self.mask.layer.animationKeys()?.count ?? 0
        if count > 0  {
            print("正在动画")

        }
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [.autoreverse, .layoutSubviews, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.mask.frame = CGRect(x: 0, y: 0, width: 88, height: 88)
//                self.lineView.frame = CGRectMake(119, 88,1, 88)
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("点击")
        animation()
    }
    
    
    
    
}
