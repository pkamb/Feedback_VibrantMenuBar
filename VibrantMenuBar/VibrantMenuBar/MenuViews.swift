//
//  MenuViews.swift
//  VibrantMenuBar
//
//  Created by Peter Kamb on 6/5/19.
//  Copyright © 2019 Feedback. All rights reserved.
//

import Cocoa

enum MenuViews: CaseIterable {
    
    case menuItem
    case disabledMenuItem
    
    func menuItem() -> NSMenuItem {
        let menuItem: NSMenuItem
        
        switch self {
        case .menuItem:
            menuItem = NSMenuItem(title: "enabled NSMenuItem",  action: nil, keyEquivalent: "")
        case .disabledMenuItem:
            menuItem = NSMenuItem(title: "disabled NSMenuItem", action: nil, keyEquivalent: "")
            menuItem.isEnabled = false
        }
        
        return menuItem
    }
    
    static func menuViews() -> [NSMenuItem] {
        
        let menuData = [
            ("normal", NSColor.clear)
        ]
        
        let menuItems: [NSMenuItem] = menuData.map({
            let view = HighlightView(frame: NSRect(x: 0, y: 0, width: 300, height: 50))
            view.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraint(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50))
            
            let label = NSTextField(labelWithString: $0.0)
            view.addArrangedSubview(label)
            
            let menuItem = NSMenuItem(title: "", action: nil, keyEquivalent: "")
            menuItem.view = view
            return menuItem
        })
        
        return menuItems
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
