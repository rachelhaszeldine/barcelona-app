//
//  XCUIElement+ScrollTo.swift
//  TescoTitan
//
//  Created by Zachary Borrelli on 25/05/2017.
//  Copyright © 2017 Tesco. All rights reserved.
//

import XCTest

extension XCUIElement {
	
	func visible() -> Bool {
		guard self.exists && !self.frame.isEmpty else { return false }
		return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
	}
	
	func scollToLastCell() {
		let lastCell = cells.element(boundBy: cells.count-1)
		scroll(toElement: lastCell)
	}
	
	func scroll(toElement element: XCUIElement, scrollUp: Bool = false) {
		var lastMidCellID = ""
		var lastMidCellRect = CGRect.zero
		var currentMidCell = cells.element(boundBy: cells.count / 2)
		
		// Scroll until the requested cell is hittable, or until we try and scroll but nothing changes
		while lastMidCellID != currentMidCell.identifier || !lastMidCellRect.equalTo(currentMidCell.frame) {
			if element.exists && element.isHittable {
				break
			}
			
			lastMidCellID = currentMidCell.identifier
			lastMidCellRect = currentMidCell.frame      // Need to capture this before the scroll
			
			if scrollUp {
				coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.4)).press(forDuration: 0.01, thenDragTo: coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.9)))
			} else {
				coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.9)).press(forDuration: 0.01, thenDragTo: coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.4)))
			}
			currentMidCell = cells.element(boundBy: cells.count / 2)
		}
	}
	
}
