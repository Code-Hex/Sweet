//
//  AppDelegate.swift
//  Sweet
//
//  Created by Kei Kamikawa on 2016/04/06.
//  Copyright © 2016年 Kei Kamikawa. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var view: SweetView!

    @IBOutlet var textview: NSTextView!
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        self.window.backgroundColor = NSColor.blackColor()
        self.window.opaque = false
        
        self.window.movableByWindowBackground = true
        self.window.contentView = self.view        

        //self.window.collectionBehavior = .CanJoinAllSpaces
        //self.window.level = Int(CGWindowLevelForKey(.MaximumWindowLevelKey))

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

