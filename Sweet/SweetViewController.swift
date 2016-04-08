//
//  SweetViewController.swift
//  Sweet
//
//  Created by Kei Kamikawa on 2016/04/06.
//  Copyright © 2016年 Kei Kamikawa. All rights reserved.
//

import Cocoa

class SweetView: NSView {
    override func awakeFromNib() {
        //self.wantsLayer = true
        self.layer!.cornerRadius = 5
        self.layer!.backgroundColor = NSColor(white: 1.0, alpha: 1.0).CGColor
        
    }
    
    override func viewDidMoveToWindow() {
        NSLog("move")
        self.window!.makeFirstResponder(self)
    }
    
    override func acceptsFirstMouse(theEvent: NSEvent?) -> Bool {
        return true
    }
}
