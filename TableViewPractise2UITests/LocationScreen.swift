//
//  LocationScreen.swift
//  TableViewPractise2
//
//  Created by Zachary Borrelli on 29/06/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import XCTest

final class LocationScreen: BaseScreen {
  let app: XCUIApplication
  
  override init() {
    app = App.shared.current()
    super.init()
  }
  
  //This function takes a parameter called 'Title' but we call it 'label' as that's technically what it is. Then we are return back an XCUIElement which is something like a staticText, button, table, cell etc. This is denoted by '-> XCUIElement' and 'return'. The element it returns is a staticText element with whatever 'label' we give it e.g. "La Rambla"
  func page(Title label: String) -> XCUIElement {
    return app.staticTexts[label]
  }
}
