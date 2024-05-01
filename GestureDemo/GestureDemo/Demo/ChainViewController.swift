//
//  ChainViewController.swift
//  GestureDemo
//
//  Created by 周明 on 2024/4/14.
//

import UIKit

class ChainViewController: UIViewController, UIScrollViewDelegate {
    lazy var mainScrollView: MainScrollView  = {
        let mainScrollView = MainScrollView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 88.0))
        mainScrollView.delegate = self
        mainScrollView.backgroundColor = .red
        mainScrollView.contentInsetAdjustmentBehavior = .never
        mainScrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height:  (UIScreen.main.bounds.size.height - 88.0) * 2)
        return mainScrollView
    }()
    
    lazy var subView: SubScrollView  = {
        let sub = SubScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 88.0))
        sub.delegate = self
        sub.backgroundColor = .blue
        sub.contentSize = CGSize(width: UIScreen.main.bounds.size.width * 2, height:  (UIScreen.main.bounds.size.height - 88.0))

        sub.contentInsetAdjustmentBehavior = .never

        return sub
    }()
    
    
//    lazy var mainView: UIView = {
//        let mainView = UIView(frame: CGRect(x: 88, y: 88, width: 44, height: 44))
//        return mainView
//    }()
//    
//    lazy var subView: UIView = {
//        let subView = UIView(frame: CGRect(x: 0, y: 88, width: 44, height: 44))
//        return subView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(subView)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if mainScrollView === scrollView {
//            print("main scroll")
//        }
//        
//        if subView === scrollView {
//            print("sub scroll")
//
//        }
    }
    
    
    


}


