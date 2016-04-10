//
//  AppDelegate.swift
//  Sweet
//
//  Created by Kei Kamikawa on 2016/04/06.
//  Copyright © 2016年 Kei Kamikawa. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, SweetTextDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var view: SweetView!
    @IBOutlet var textview: SweetTextView!
    @IBOutlet weak var scrollView: NSScrollView!
    @IBOutlet weak var clipView: NSClipView!
    @IBOutlet weak var image: NSImageView!
    
    let label = NSTextField(frame: NSMakeRect(16, 0, 30, 30))
    var SEView: SweetEffectView!
    
    let d: CGFloat = 63.0
    let minHeight: CGFloat = 63.0
    let maxHeight: CGFloat = 63.0 * 2
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        self.window.titleVisibility = .Hidden
        self.window.titlebarAppearsTransparent = true
        self.window.backgroundColor = NSColor.clearColor()
        self.window.opaque = false
        self.window.hasShadow = true
        self.window.styleMask = NSBorderlessWindowMask | NSFullSizeContentViewWindowMask

        
        self.window.movableByWindowBackground = true
        //self.window.contentView = self.view
        self.textview.stdelegate = self
        
        
        self.image.image = NSImage(contentsOfURL: NSURL(string: "https://pbs.twimg.com/profile_images/661120060694491136/ofwAWYp4.png")!)
        
        self.label.font = NSFont.systemFontOfSize(14)
        self.label.backgroundColor = NSColor.clearColor()
        self.label.bordered = false
        self.label.editable = false
        
        SEView = SweetEffectView(frame: NSMakeRect(0, 0, 678, 55))
        SEView.addSubview(self.label)
        self.view.addSubview(SEView)
        
        self.window.invalidateShadow()

        //self.window.collectionBehavior = .CanJoinAllSpaces
        //self.window.level = Int(CGWindowLevelForKey(.MaximumWindowLevelKey))

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func updateView() {
        print("n")
        
        //print(v.origin.y, tv.origin.y, self.scrollView.frame.origin.y, self.clipView.frame.origin.y)
        //print(v.height, tv.height, self.scrollView.frame.height, self.clipView.frame.height)
        
        
        if self.view.frame.height + d < maxHeight {
            var wFrame = self.window.frame
            wFrame.size.height += d
            wFrame.origin.y -= d
            self.window.setFrame(wFrame, display: true)
            
            var useRect = self.textview.textContainer!.layoutManager!.usedRectForTextContainer(self.textview.textContainer!)
            useRect.size.height += d
            //useRect.origin.y -= d
            
            self.textview.frame = useRect
            
        } else {
            print("fail")
        }
        
    }

    func updateCount(count: Int) {
        print("C: \(count)")
        
        if count == 0 {
            var wFrame = self.window.frame
            wFrame.size.height -= d
            wFrame.origin.y += d
            self.window.setFrame(wFrame, display: true)
            
            self.label.stringValue = ""
        } else {
            self.label.stringValue = "\(140 - count)"
        }
        
        let v = self.view.frame
        //self.textview.frame.size.height = self.scrollView.frame.size.height
        let tv = self.textview.frame
        
        print(self.window.frame.height - 22)
        print(v.origin.y, tv.origin.y, self.scrollView.frame.origin.y, self.clipView.frame.origin.y)
        print(v.height, tv.height, self.scrollView.frame.height, self.clipView.frame.height)
    }
}

