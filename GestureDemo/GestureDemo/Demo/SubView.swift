//
//  SubView.swift
//  GestureDemo
//
//  Created by 周明 on 2024/4/14.
//

import UIKit

class SubView: UIView {


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("subV touchesBegan")
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("subV touchesMoved")
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("subV touchesCancelled")
        super.touchesCancelled(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("subV touchesEnded")
        super.touchesEnded(touches, with: event)
    }
}
