//
//  TestSteps.swift
//  TableViewPractise2
//
//  Created by Rachel Quartly on 29/06/2017.
//  Copyright © 2017 Rachel Quartly. All rights reserved.
//

import XCTest
import XCTest_Gherkin

class TestSteps: StepDefiner {
    
    override func defineSteps() {
        step("I have opened the app") {
            sleep(5)
        }
    }
}
