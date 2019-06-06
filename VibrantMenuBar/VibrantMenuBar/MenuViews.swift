//
//  MenuViews.swift
//  VibrantMenuBar
//
//  Created by Peter Kamb on 6/5/19.
//  Copyright © 2019 Feedback. All rights reserved.
//

import Cocoa

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
