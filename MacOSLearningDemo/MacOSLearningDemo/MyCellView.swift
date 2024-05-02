//
//  MyCellView.swift
//  MacOSLearningDemo
//
//  Created by ming zhou on 2024/5/2.
//

import Cocoa

class MyCellView: NSView {

    @IBOutlet weak var label: NSTextField!
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        
    }
    
    override func awakeFromNib() {
        label.font = NSFont.systemFont(ofSize: 18.0)
    }
    
    func configure(text: String) {
        label.stringValue = text
    }
    
}
