//
//  UITestingGlobalFunctions.swift
//  BarcelonaApp
//
//  Created by Zachary Borrelli on 25/05/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import XCTest

/**
Waits for an element to appear and raises a failure if it doesn't appear in the specified time

- parameter explicitElement: Element that's supposed to appear
- parameter maxDuration:     Maximum wait time
*/
func waitForElementToAppear(_ element: XCUIElement, maxDuration: Int = 5, file: StaticString = #file, line: UInt = #line) {
	let predicate = NSPredicate(format: "exists == 1", argumentArray: nil)
	let testCase = XCTestCase()
	testCase.expectation(for: predicate, evaluatedWith: element, handler: nil)
	testCase.waitForExpectations(timeout: Double(maxDuration))
	if !element.exists {
		XCTFail("Timed out waiting for element: -\(element)- to appear.", file: file, line: line)
	}
}

func tapWhenElementAppears(_ element: XCUIElement, maxDuration: Int = 5, file: StaticString = #file, line: UInt = #line) {
	let predicate = NSPredicate(format: "exists == 1", argumentArray: nil)
	let testCase = XCTestCase()
	testCase.expectation(for: predicate, evaluatedWith: element, handler: nil)
	testCase.waitForExpectations(timeout: Double(maxDuration))
	if !element.exists {
		XCTFail("Timed out waiting for element: -\(element)- to appear.", file: file, line: line)
	}
	element.tap()
}

/**
Waits for an elemnt to disappear and raises a failure if it doesn't disappear in the specified time

- parameter element:     Element that's supposed to disappear
- parameter testCase:    Scenario the wait function is called from
- parameter maxDuration: Eaximum wait time
*/
func waitForElementToDisappear(_ element: XCUIElement, maxDuration: Int = 5, file: StaticString = #file, line: UInt = #line) {
	let predicate = NSPredicate(format: "exists == 0", argumentArray: nil)
	let testCase = XCTestCase()
	testCase.expectation(for: predicate, evaluatedWith: element, handler: nil)
	testCase.waitForExpectations(timeout: Double(maxDuration), handler: nil)
	
	if element.exists {
		XCTFail("Timed out waiting for element: -\(element)- to disappear.", file: file, line: line)}
}
