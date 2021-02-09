//
//  GherkinTestsTests.swift
//  GherkinTestsTests
//
//  Created by Piotr Szadkowski on 09/02/2021.
//

import XCTest
import XCTest_Gherkin
@testable import GherkinTests

class GherkinTestsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        self.continueAfterFailure = true
    }
    
    func testIsItFriday() {
        Given("today is Sunday")
        When("I ask wheter it's Friday yet")
        Then("I should be told Nope")
    }
    
    func testFridayOutline() {
        
        Outline {
            Given("today is <day>")
            When("I ask wheter it's Friday yet")
            Then("I should be told <answer>")
        } _: { () -> [[String]] in
            return [
                ["day" , "answer"],
                ["Friday", "Yes"],
                ["Sunday", "Nope"],
                ["Eeeeeee", "Nope"]
            ]
        }

    }
    
}

final class FridayServiceSteps: StepDefiner {
    
    private var today: String!
    private var actualAnswer: String!
    
    private func isItFriday(_ day: String) -> String {
        return day == "Friday" ? "Yes" : "Nope"
    }
    
    override func defineSteps() {
        
//        step("today is (.*)") { (day: String) in
//            self.today = day
//        }
//        
//        step("I ask wheter it's Friday yet") {
//            self.actualAnswer = self.isItFriday(self.today)
//        }
//        
//        step("I should be told (.*)") { (expectedAnswer: String) in
//            XCTAssertEqual(self.actualAnswer, expectedAnswer)
//        }
    }
    
    
}
