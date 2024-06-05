//
//  ViewController.swift
//  ButtonDemo
//
//  Created by ming zhou on 2024/5/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "user_center_play_icon"), for: .normal)
        button.setTitle("标题", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)
        button.center = CGPoint(x: UIScreen.main.bounds.size.width * 0.5, y: UIScreen.main.bounds.size.height * 0.5)
    

        button.sizeToFit()
//        print("😄" + "\(button.frame.size)")

        button.frame.size = CGSize(width: 62 , height: button.frame.size.height)
        
//        print("😄" + "\(button.frame.size)")
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -5)
        print("😄" + "titleEdgeInsets:\(button.titleEdgeInsets)")
        print("😄" + "imageEdgeInsets:\(button.imageEdgeInsets)")

    }


}

