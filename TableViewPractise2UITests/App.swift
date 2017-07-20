//
//  App.swift
//  TableViewPractise2
//
//  Created by Zachary Borrelli on 24/05/2017.
//  Copyright © 2017 Tesco. All rights reserved.
//

import Foundation
import XCTest

/**
Singleton in charge of creating XCUIApplication instance and managing the global app state,
This is created so the same application instance can be used accross different pages of the app and
the instance we are calling is the one that got launched.
*/
final class App {
	
	static let shared = App()
	
	fileprivate var currentApp: XCUIApplication?
	fileprivate var globalCalendar: Calendar = {
		let cal = Calendar(identifier: Calendar.Identifier.gregorian)
		return cal
	}()
	
	fileprivate init () {}
	
	func terminate() {
		currentApp?.terminate()
		currentApp = nil
	}
	
	func launchWithOptions() {
		currentApp = XCUIApplication()
		currentApp?.launch()
	}
	
	func current() -> XCUIApplication {
		if let app =  currentApp {
			return app
		}
		let app = XCUIApplication()
		currentApp = app
		return app
	}
	
	func calendar() -> Calendar {
		return globalCalendar
	}
}
