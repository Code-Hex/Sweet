//
//  SweetTextView.swift
//  Sweet
//
//  Created by CodeHex on 2016/04/08.
//  Copyright © 2016年 Kei Kamikawa. All rights reserved.
//

import Cocoa

protocol SweetTextDelegate {
    func updateView()
    func updateCount(count: Int)
}

class SweetScrollView: NSScrollView {
    override func awakeFromNib() {
        self.backgroundColor = NSColor.clearColor()
        self.contentView.backgroundColor = NSColor.clearColor()
        //self.hasVerticalScroller = true
    }

}

class SweetTextView: NSTextView {
    
    var stdelegate: SweetTextDelegate?
    let size: CGFloat = 22.0 // fontsize
    
    override var textContainerOrigin: NSPoint {
        let o = super.textContainerOrigin
        //NSLog("%f",o.y + 10)
        return NSMakePoint(o.x, o.y)
    }
    
    override func awakeFromNib() {
        /*
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 200
        self.defaultParagraphStyle = style
        */
        self.backgroundColor = NSColor.clearColor()
        self.font = NSFont.systemFontOfSize(size)
        self.richText = false
    }
    
    override func didChangeText() {
        //stdelegate?.updateCount(self.string!.characters.count)
        if self.string!.characters.count <= 140 {
            if !self.string!.isEmpty {
                stdelegate?.updateView()
            }
            stdelegate?.updateCount(self.string!.characters.count)
        } else {
            self.string = self.string!.substringToIndex(self.string!.endIndex.predecessor())
        }
        
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        if self.string!.isEmpty && self.window!.firstResponder.acceptsFirstResponder {
            let color = NSColor.grayColor()
            let placeholder = NSAttributedString(string: "What's happening?", attributes: [NSForegroundColorAttributeName : color, NSFontAttributeName : NSFont.systemFontOfSize(size)])
            placeholder.drawAtPoint(NSMakePoint(6, 0))
        }
    }
    
}
