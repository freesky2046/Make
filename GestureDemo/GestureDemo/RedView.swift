//
//  RedView.swift
//  GestureDemo
//
//  Created by ming zhou on 2024/4/23.
//

import UIKit

class RedView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("😄 RedView" + "touchesBegan")

        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("😄 RedView" + "touchesEnded")

        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("😄 RedView " + "touchesCancelled")
        super.touchesCancelled(touches, with: event)
    }

}
