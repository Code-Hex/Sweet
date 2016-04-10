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
        self.layer!.cornerRadius = 5
        self.layer!.backgroundColor = NSColor(white: 1.0, alpha: 1.0).CGColor
    }
}
