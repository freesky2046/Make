//
//  ViewController.swift
//  GestureDemo
//
//  Created by ming zhou on 2024/4/23.
//

import UIKit

class ViewController: UIViewController {
    private lazy var redView = RedView(frame: CGRect(x: 0, y: 100, width: 44, height: 44))
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        noGesutureSituation1()
//        HittestViewGesutureSituation2()
        HittestViewSuperViewGesutureSituation3()
    }
    
    // 情形 1 无手势
    func noGesutureSituation1() {
        view.addSubview(redView)
        redView.backgroundColor = .red
    }
    
    // 情形 2:手势在第一响应者
    func HittestViewGesutureSituation2() {
        noGesutureSituation1()
        let tap = MyTapGestureRecoginizer(target: self, action: #selector(tapAction))
//        tap.cancelsTouchesInView = false
        redView.addGestureRecognizer(tap)
    }
    
    // 情形 2:手势在第一响应者的父视图
    func HittestViewSuperViewGesutureSituation3() {
        noGesutureSituation1()
        let tap = MyTapGestureRecoginizer(target: self, action: #selector(tapAction))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func tapAction() {
        print("😄 redView" + "手势响应")

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("😄 ViewController " + "touchesBegan")
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("😄 ViewController " + "touchesEnded")
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("😄 ViewController " + "touchesCancelled")
        super.touchesCancelled(touches, with: event)
    }

}

