//
//  SweetEffectView.swift
//  Sweet
//
//  Created by Kei Kamikawa on 2016/04/06.
//  Copyright © 2016年 Kei Kamikawa. All rights reserved.
//

import Cocoa

class SweetEffectView: NSVisualEffectView {
    
    var bgLayer = CALayer()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        //self.addSubview(shadowView)
        self.wantsLayer = true
        self.layer!.cornerRadius = 5

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        self.wantsLayer = true
        //self.layer!.cornerRadius = 10.0
        self.layer!.opacity = 0.2
        //self.layer!.shadowColor = NSColor.redColor().CGColor
        //self.layer!.backgroundColor = NSColor(white: 1.0, alpha: 1.0).CGColo
 /*
        NSNotificationCenter.defaultCenter().addObserverForName(NSViewFrameDidChangeNotification, object: self, queue: NSOperationQueue.mainQueue(), usingBlock: {
            _ in
            self.layer = self.bgLayer
            
            NSLog("dccred")
        })
*/
    }
    
}
