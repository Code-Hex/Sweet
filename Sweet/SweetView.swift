//
//  SweetView.swift
//  Sweet
//
//  Created by Kei Kamikawa on 2016/04/10.
//  Copyright © 2016年 Kei Kamikawa. All rights reserved.
//

import Cocoa

class SweetView: NSView {
    
    override func awakeFromNib() {
/*
        self.layer!.borderColor = NSColor.redColor().CGColor
        self.layer!.borderWidth = 1
        self.layer!.cornerRadius = 5.0
*/
    }
    
    override func drawRect(dirtyRect: NSRect) {
        NSColor.clearColor().setFill()
        NSRectFill(dirtyRect)
        super.drawRect(dirtyRect)
    }
}
