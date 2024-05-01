//
//  SubScrollView.swift
//  GestureDemo
//
//  Created by 周明 on 2024/4/14.
//

import UIKit

class SubScrollView: UIScrollView, UIGestureRecognizerDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("sub touchesBegan")
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("sub touchesMoved")
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("sub touchesCancelled")
        super.touchesCancelled(touches, with: event)
    }
    
    
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//
//        return true
//    }

}
