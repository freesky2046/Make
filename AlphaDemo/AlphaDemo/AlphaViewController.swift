//
//  AlphaViewController.swift
//  AlphaDemo
//
//  Created by 周明 on 2024/4/5.
//

import UIKit

class AlphaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 父视图 带alpha
        let red = UIView(frame: CGRect(x: 88, y: 88, width: 100, height: 100))
        red.backgroundColor = .red
        red.alpha = 0.5
        view.addSubview(red)
        
        let blue = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        blue.backgroundColor = .blue
        red.addSubview(blue)
        
        let blue2 = UIView(frame: CGRect(x: 88, y: 188, width: 50, height: 50))
        blue2.backgroundColor = .blue
        blue2.alpha = 0.5
        view.addSubview(blue2)
        
        
        // 子视图 带alpha
        let red2 = UIView(frame: CGRect(x: 88, y: 288, width: 100, height: 100))
        red2.backgroundColor = .red
        red2.alpha = 1.0
        view.addSubview(red2)
        
        let blue3 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        blue3.backgroundColor = .blue
        blue3.alpha = 0.5
        red2.addSubview(blue3)
        
        let blue4 = UIView(frame: CGRect(x: 88, y: 388, width: 50, height: 50))
        blue4.backgroundColor = .blue
        blue4.alpha = 0.5
        view.addSubview(blue4)
        
        // 先加到父视图的兄弟视图带 alpha
        let superview = UIView(frame: CGRect(x: 88, y: 460, width: 100, height: 100))
        view.addSubview(superview)
        
        let redsub = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        redsub.backgroundColor = .red
        redsub.alpha = 0.5
        superview.addSubview(redsub)
        
        let bluesub = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bluesub.backgroundColor = .blue
        superview.addSubview(bluesub)
        
        // 后加到父视图的兄弟视图带 alpha

        let superview2 = UIView(frame: CGRect(x: 88, y: 600, width: 100, height: 100))
        view.addSubview(superview2)
        let redsub2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        redsub2.backgroundColor = .red
        superview2.addSubview(redsub2)
        let bluesub2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bluesub2.backgroundColor = .blue
        bluesub2.alpha = 0.5
        superview2.addSubview(bluesub2)
        
        let bluesub3 = UIView(frame: CGRect(x: 0, y: 700, width: 100, height: 100))
        bluesub3.backgroundColor = .blue
        bluesub3.alpha = 0.5
        view.addSubview(bluesub3)
    }
    
    


  

}
