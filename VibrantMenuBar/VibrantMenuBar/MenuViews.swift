//
//  MenuViews.swift
//  VibrantMenuBar
//
//  Created by Peter Kamb on 6/5/19.
//  Copyright © 2019 Feedback. All rights reserved.
//

import Cocoa

enum MenuViews: CaseIterable {
    
    static let menuItemFrame = NSRect(x: 0, y: 0, width: 300, height: 50)
    
    case menuItem
    case disabledMenuItem
    case customView
    case customViewDrawRect
    case viewHandlesEvents
    
    func menuItem() -> NSMenuItem {
        let menuItem: NSMenuItem
        
        switch self {
        case .menuItem:
            menuItem = NSMenuItem(title: "enabled NSMenuItem",  action: nil, keyEquivalent: "")
        case .disabledMenuItem:
            menuItem = NSMenuItem(title: "disabled NSMenuItem", action: nil, keyEquivalent: "")
            menuItem.isEnabled = false
        case .customView:
            let label = NSTextField(labelWithString: "basic custom view")
            let view = NSStackView(frame: MenuViews.menuItemFrame)
            view.addArrangedSubview(label)
            menuItem = NSMenuItem()
            menuItem.view = view
        case .customViewDrawRect:
            let label = NSTextField(labelWithString: "custom view + drawRect selection highlighting")
            let view = HighlightView(frame: MenuViews.menuItemFrame)
            view.addArrangedSubview(label)
            menuItem = NSMenuItem()
            menuItem.view = view
        case .viewHandlesEvents:
            let label = NSTextField(labelWithString: "`_viewHandlesEvents = false` private API")
            let view = NSStackView(frame: MenuViews.menuItemFrame)
            view.addArrangedSubview(label)
            menuItem = NSMenuItem()
            menuItem.view = view
            menuItem._viewHandlesEvents = false
        }
        
        return menuItem
    }
    
}

class HighlightView: NSStackView {
    
    override func draw(_ dirtyRect: NSRect) {
        guard enclosingMenuItem?.isHighlighted == true else {
            super.draw(dirtyRect)
            return
        }
        
        NSColor.selectedMenuItemColor.set()
        dirtyRect.fill()
    }
    
}
