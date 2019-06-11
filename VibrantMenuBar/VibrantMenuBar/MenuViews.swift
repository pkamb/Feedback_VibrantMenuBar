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
    
    case disabledMenuItem
    case menuItem
    case customView
    case customViewDrawRect
    case viewHandlesEvents
    
    var title: String {
        switch self {
        case .disabledMenuItem:   return "disabled NSMenuItem"
        case .menuItem:           return "enabled NSMenuItem"
        case .customView:         return "basic custom view"
        case .customViewDrawRect: return "custom view + drawRect selection highlighting"
        case .viewHandlesEvents:  return "`_viewHandlesEvents = false` private API"
        }
    }
    
    func menuItem() -> NSMenuItem {
        let menuItem: NSMenuItem
        
        switch self {
        case .disabledMenuItem:
            menuItem = NSMenuItem(title: title, action: nil, keyEquivalent: "")
            menuItem.isEnabled = false
        case .menuItem:
            menuItem = NSMenuItem(title: title,  action: nil, keyEquivalent: "")
        case .customView:
            let label = NSTextField(labelWithString: title)
            let view = NSStackView(frame: MenuViews.menuItemFrame)
            view.addArrangedSubview(label)
            menuItem = NSMenuItem()
            menuItem.view = view
        case .customViewDrawRect:
            let label = NSTextField(labelWithString: title)
            let view = HighlightView(frame: MenuViews.menuItemFrame)
            view.addArrangedSubview(label)
            menuItem = NSMenuItem()
            menuItem.view = view
        case .viewHandlesEvents:
            let label = NSTextField(labelWithString: title)
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
