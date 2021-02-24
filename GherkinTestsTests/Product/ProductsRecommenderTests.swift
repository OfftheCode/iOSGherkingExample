//
//  ProductsRecommenderTests.swift
//  GherkinTestsTests
//
//  Created by Piotr Szadkowski on 24/02/2021.
//

import XCTest
import XCTest_Gherkin
@testable import GherkinTests

class ProductsRecommenderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        self.continueAfterFailure = true
    }
    
    func testRecommendationOutline() {
        
        Outline {
            Given("user have <hobby>")
            When("product name is <product_name>")
            Then("product should be <recommended>")
        } _: { () -> [[String]] in
            return [
                ["hobby" , "product_name", "recommended"],
                ["Plant", "Super Plant", "yes"],
                ["Music", "Amazing Juice", "no"],
                ["plant", "Futuristic plant", "yes"]
            ]
        }

    }
    
}

final class ProductsRecommenderTestsSteps: StepDefiner {
    
    private var productsRecommender: ProductRecommender = ProductRecommender(recommendationPolicy: .default)
    private var hobby: Hobby!
    private var productName: String!
    
    private func isItFriday(_ day: String) -> String {
        return day == "Friday" ? "Yes" : "Nope"
    }
    
    override func defineSteps() {
        
        step("user have (.*)") { (hobby: Hobby) in
            self.hobby = hobby
        }
        
        step("product name is (.*)") { (productName: String) in
            self.productName = productName
        }
        
        step("product should be (.*)") { (isRecommended: String) in
            let didRecommend = self.productsRecommender.shouldRecommend(product: Product(justName: self.productName), for: User(justHobby: self.hobby))
            XCTAssertEqual(didRecommend, isRecommended.boolFromYesNo)
        }
    }
    
    
}

extension String {
    var boolFromYesNo: Bool {
        return self == "yes"
    }
}

private extension Product {
    init(justName name: String) {
        self.init(id: UUID(), name: name, description: "", productResourceName: "", price: 0.0)
    }
}

private extension User {
    init(justHobby hobby: Hobby) {
        self.init(id: UUID(), hobbys: [hobby])
    }
}
