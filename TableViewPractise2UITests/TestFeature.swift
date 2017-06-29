//
//  TestFeature.swift
//  TableViewPractise2
//
//  Created by Zachary Borrelli on 29/06/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import XCTest

class TestFeature: Feature {
  
  func test_firstScenario() {
    Given("I have opened the app")
    When("I tap on La Rambla")
    Then("I should see the page title of La Rambla")
  }
}
