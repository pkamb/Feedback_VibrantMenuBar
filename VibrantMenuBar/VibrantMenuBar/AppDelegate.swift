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
        
        let menuItems = MenuViews.allCases.map({ $0.menuItem() })
        
        menuItems.forEach{
            $0.target = self
            $0.action = #selector(menuItemAction(sender:))
        }

        vibrantMenuItem.submenu?.items = menuItems
    }
    
    @objc func menuItemAction(sender: NSMenuItem) {
        print("menuItemAction")
    }
    
}

