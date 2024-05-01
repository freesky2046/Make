//
//  ViewController.swift
//  PanGestureDemo
//
//  Created by 周明 on 2024/4/21.
//

import UIKit

class ViewController: UIViewController {

    private var lastCenter: CGPoint = CGPointZero
    private var blueView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad frame:" + "\(self.view.frame)")
        view.backgroundColor = .white
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))

        let blueView = UIView(frame: CGRect(x: 80, y: 80, width: 300, height: 300))
        blueView.backgroundColor = .blue
        blueView.addGestureRecognizer(panGesture)
        view.addSubview(blueView)
        if panGesture.state.rawValue == 0 {
            print("possible")
        }
        self.blueView = blueView
        
        let panGestureState: UIGestureRecognizer.State = .recognized
        print(panGestureState.rawValue)
    }
    
    @objc
    func panGestureAction(_ pan: UIPanGestureRecognizer) {
        /// 手在哪个位置
        let translation = pan.translation(in: pan.view)
        switch pan.state {
        case .began:
            lastCenter = self.blueView.center
            break
        case .changed:
            self.blueView.center = CGPoint(x: lastCenter.x + translation.x, y: lastCenter.y + translation.y)
            break
        case .ended:
            self.blueView.center = CGPoint(x: lastCenter.x + translation.x, y: lastCenter.y + translation.y)
        case .cancelled:
            self.blueView.center = CGPoint(x: lastCenter.x + translation.x, y: lastCenter.y + translation.y)
    
        case .possible, .failed:
            break
        @unknown default:
            break
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews frame:" + "\(self.view.frame)")

    }
}

