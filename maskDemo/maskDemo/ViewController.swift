//
//  ViewController.swift
//  maskDemo
//
//  Created by ming zhou on 2024/7/5.
//

import UIKit

class ViewController: UIViewController {

    private let gradientLayer: CAGradientLayer = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(named: "123"))
 
        imageView.sizeToFit()
        imageView.center = CGPoint(x: UIScreen.main.bounds.size.width * 0.5, y: UIScreen.main.bounds.size.height * 0.5)
        view.addSubview(imageView)
        
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: imageView.frame.size.height - 10, width: imageView.frame.size.width, height: 10)
        view.backgroundColor = .clear
        
        
        gradientLayer.colors = [UIColor(white: 1, alpha: 1).cgColor,
                                UIColor(white: 1, alpha: 0.1).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = view.bounds
        view.layer.mask = gradientLayer
        
        imageView.addSubview(view)
        
    }


}

