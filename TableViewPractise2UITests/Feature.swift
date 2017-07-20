//
//  Feature.swift
//  TableViewPractise2
//
//  Created by Zachary Borrelli on 25/05/2017.
//  Copyright © 2017 Tesco. All rights reserved.
//

import XCTest

class Feature: XCTestCase {
	
	override func setUp() {
		super.setUp()
		continueAfterFailure = false
		launchApp()
	}
	
	func launchApp() {
		App.shared.launchWithOptions()
	}
	
	override func tearDown() {
		App.shared.terminate()
		super.tearDown()
	}
}
