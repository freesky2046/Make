//
//  MyTapGestureRecoginizer.swift
//  GestureDemo
//
//  Created by ming zhou on 2024/5/1.
//

import UIKit

class MyTapGestureRecoginizer: UITapGestureRecognizer {

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        print("😄" + "MyTapGestureRecoginizer touchesBegan")
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)

    }
}
