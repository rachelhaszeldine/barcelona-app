//
//  BaseScreen.swift
//  TableViewPractise2
//
//  Created by Zachary Borrelli on 29/06/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import XCTest

class BaseScreen {
  func assertElement(_ element: XCUIElement, cellCount: Int, file: StaticString = #file, line: UInt = #line) {
    var visibleCells = [XCUIElement]()
    for cellIndex in 0..<element.cells.count {
      let cell = element.cells.element(boundBy: cellIndex)
      if cell.isHittable { visibleCells.append(cell) }
    }
    XCTAssertEqual(visibleCells.count, cellCount, file: file, line: line)
  }
}
