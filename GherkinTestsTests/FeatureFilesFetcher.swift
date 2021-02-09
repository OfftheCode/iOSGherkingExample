//
//  FeatureFilesFetcher.swift
//  GherkinTestsTests
//
//  Created by Piotr Szadkowski on 09/02/2021.
//

import XCTest
import XCTest_Gherkin

final class FeatureFilesRunnerTest: NativeTestCase {
    
    override class func path() -> URL? {
        let bundle = Bundle(for: self)
        return bundle.resourceURL?.appendingPathComponent("is_it_friday_yet.feature")
    }
    
    override func setUp() {
        super.setUp()
        print("Default setup method works before each native scenario")
    }
}


final class FridayNativeRunner: XCTestCase {
    
    func testFriday() {
        NativeRunner.runFeature(featureFile: "is_it_friday_yet.feature", testCase: self)
    }
    
}

final class FridayGherkinServiceSteps: StepDefiner {
    
    private var today: String!
    private var actualAnswer: String!
    
    private func isItFriday(_ day: String) -> String {
        return day.replacingOccurrences(of: "\"", with: "") == "Friday" ? "Yes" : "Nope"
    }
    
    override func defineSteps() {
        
        step("today is (.*)") { (day: String) in
            print(day)
            self.today = day
        }
        
        step("I ask if it's Friday") {
            self.actualAnswer = self.isItFriday(self.today)
        }
        
        step("I should be told (.*)") { (expectedAnswer: String) in
            XCTAssertEqual(self.actualAnswer!, expectedAnswer.replacingOccurrences(of: "\"", with: ""))
        }
        
    }
    
    
}
