//
//  ContentOffsetViewController.swift
//  ScrollViewDemo
//
//  Created by 周明 on 2024/4/7.
//

import UIKit

class ContentOffsetViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: 200))
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.bounces = false
        scrollView.delegate = self
        view.addSubview(scrollView)

        let redView = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.size.width, 200))
        redView.backgroundColor = .red
        scrollView.addSubview(redView)
        let blueView = UIView(frame: CGRectMake(0, 200, UIScreen.main.bounds.size.width, 200))
        blueView.backgroundColor = .blue
        scrollView.addSubview(blueView)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 400)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("bounds:" + "\(scrollView.bounds)")
        print("contentOffset:" + "\(scrollView.contentOffset)")
    }


}
