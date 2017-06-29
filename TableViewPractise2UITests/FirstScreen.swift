//
//  FirstScreen.swift
//  TableViewPractise2
//
//  Created by Zachary Borrelli on 29/06/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import XCTest

final class FirstScreen: BaseScreen {
  let app: XCUIApplication
  let trait: XCUIElement
  
  override init() {
    app = App.shared.current()
    trait = app.staticTexts["Barcelona!"]
    super.init()
  }
  
  //I have created an element called trait above and here all I'm doing is asserting its existence
  func assertFirstScreen() {
    XCTAssert(trait.exists)
  }
  
  //This is the same as the page(Title) function in the LocationScreen, see there for an explanation around what this means.
  private func location(withName name: String) -> XCUIElement {
    return app.staticTexts[name]
  }
  
  //Here we're taking in a 'name' parameter e.g. "La Rambla", getting an staticText element from the 'location(withName)' function above and calling the '.tap()' method on that element. This does the obvioust thing of trying to tap that element. If that element isn't present it will fail the test.
  func selectLocation(withName name: String) {
    location(withName: name).tap()
  }
}
