//
//  MainScrollView.swift
//  GestureDemo
//
//  Created by 周明 on 2024/4/14.
//

import UIKit

class MainScrollView: UIScrollView, UIGestureRecognizerDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("main touchesBegan")
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("main touchesMoved")
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("main touchesCancelled")
        super.touchesCancelled(touches, with: event)
    }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
}
