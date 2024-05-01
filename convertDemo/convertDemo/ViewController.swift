//
//  ViewController.swift
//  convertDemo
//
//  Created by ming zhou on 2024/4/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let redView = UIView(frame: CGRect(x: 40, y: 40, width: 40, height: 40))
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        let redsubView = UIView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        redsubView.backgroundColor = .purple
        redView.addSubview(redsubView)
        
        let blueView = UIView(frame: CGRect(x: 40, y: 80, width: 40, height: 40))
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        
        let rect = redView.convert(redsubView.frame, to: blueView)
        print("😄 转换自己的子视图到兄弟视图坐标" + "\(rect)")
        
        let rect2 = redView.convert(redsubView.frame, to: self.view)
        print("😄 转换自己的子视图到父视图坐标体系" + "\(rect2)")



    }


}

