//
//  TestSteps.swift
//  TableViewPractise2
//
//  Created by Zachary Borrelli on 29/06/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import XCTest
import XCTest_Gherkin

class TestSteps: StepDefiner {
  //This is to insatiate the screens so we can access what's on them at that point in time
  let firstScreen = FirstScreen()
  let locationScreen = LocationScreen()
  
  override func defineSteps() {
    step("I have opened the app") {
      //If you CMND + click '.assertFirstScreen' it will take you to the function that I made here to just quickly assert we're on the main pgage
      self.firstScreen.assertFirstScreen()
    }
    
    step("I tap on ([a-zA-Z0-9, ]*)") { locationName in
      //Here I'm taking "La Rambla" from the WHEN step in my feature and casting it to 'locationName' which is then being passed through to firstScreen.selectLocation - CMND + click 'selectLocation' to find out more
      self.firstScreen.selectLocation(withName: locationName)
    }
    
    step("I should see the page title of ([a-zA-Z0-9, ]*)") { pageTitle in
      //Same as above, I've taken the name "La Rambla" and set it as 'pageTitle' and using the 'XCTAssertTrue' function will pass back a true or false on us asking if that pageTitle exists
      XCTAssertTrue(self.locationScreen.page(Title: pageTitle).exists)
    }
  }
}
