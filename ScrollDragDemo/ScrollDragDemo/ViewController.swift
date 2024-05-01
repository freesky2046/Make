//
//  ViewController.swift
//  ScrollDragDemo
//
//  Created by ming zhou on 2024/4/24.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 88))
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: scrollView.frame.size.height * 40)
        scrollView.addObserver(self, forKeyPath: "isDragging", options: [.new], context: nil)
        view.addSubview(scrollView)
        
        
    }
    
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        print("😄scrollViewDidScroll isDragging: " + "\(scrollView.isDragging)")

    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
           if keyPath == "isDragging" {
               if let newValue = change?[.newKey] as? Bool {
                   // 处理属性变化
                   print("isDragging: \(newValue)")
               }
           }
       }
    

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("😄scrollViewWillBeginDragging isDragging: " + "\(scrollView.isDragging)")

    }
    

    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("😄scrollViewDidEndDragging isDragging: " + "\(scrollView.isDragging)")

    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("😄scrollViewWillEndDragging isDragging: " + "\(scrollView.isDragging)")

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("😄scrollViewDidEndDecelerating isDragging: " + "\(scrollView.isDragging)")

    }
    
    
}

