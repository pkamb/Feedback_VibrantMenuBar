//
//  AppDelegate.swift
//  VibrantMenuBar
//
//  Created by Feedback on 6/5/19.
//  Copyright © 2019 Feedback. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var vibrantMenuItem: NSMenuItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        var menuItems = [NSMenuItem]()
        for menuItem in MenuViews.allCases.map({ $0.menuItem() }) {
            menuItem.target = self
            menuItem.action = #selector(menuItemAction(sender:))
            menuItems.append(menuItem)
            menuItems.append(NSMenuItem.separator())
        }
        vibrantMenuItem.submenu?.items = menuItems
        
        for menuItem in menuItems {
            vibrantMenuItem.submenu?.highlight(menuItem)
        }
    }
    
    @objc func menuItemAction(sender: NSMenuItem) {
        if sender.title == MenuViews.automaticallyHighlightMenuItems.title {
            if sender.state == .off {
                sender.state = .on
            } else {
                sender.state = .off
            }
        }
    }
    
}
