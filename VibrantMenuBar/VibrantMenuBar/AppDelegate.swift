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
    }
    
    func highlightMenuItem(at index: Int) {
        var index = index
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            guard let menu = self.vibrantMenuItem.submenu else { return }
            guard menu.items.first!.state == .on else { return }
            
            let highlightMenuItems = menu.items.filter({ $0.shouldAutomaticallyHighlight })
            if index >= highlightMenuItems.count {
                index = 0
            }
            
            let menuItem = highlightMenuItems[index]
            menu.highlight(menuItem)
            self.highlightMenuItem(at: index + 1)
        }
    }
    
    @objc func menuItemAction(sender: NSMenuItem) {
        if sender.title == MenuViews.automaticallyHighlightMenuItems.title {
            if sender.state == .off {
                sender.state = .on
                highlightMenuItem(at: 0)
            } else {
                sender.state = .off
            }
        }
    }
    
}
