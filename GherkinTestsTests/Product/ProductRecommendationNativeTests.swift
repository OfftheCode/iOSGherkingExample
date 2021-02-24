//
//  ProductRecommendationNativeTests.swift
//  GherkinTestsTests
//
//  Created by Piotr Szadkowski on 24/02/2021.
//

import XCTest
import XCTest_Gherkin
@testable import GherkinTests

final class FeatureFilesRunnerTest: NativeTestCase {

    override class func path() -> URL? {
        let bundle = Bundle(for: self)
        return bundle.resourceURL?.appendingPathComponent(.featureFile)
    }

    override func setUp() {
        super.setUp()
        print("Default setup method works before each native scenario")
    }
}

final class ProductRecommendationRunner: XCTestCase {

    func testBlackFriday() {
        NativeRunner.runScenario(featureFile: .featureFile, scenario: "On blackfriday all products are recommended", testCase: self)
    }

}

final class ProductsRecommenderNativeTestsSteps: StepDefiner {
    
    private var productsRecommender: ProductRecommender!
    private let user: UserProtocol = User.mock
    private let exampleProducts: [Product] = [
        .init(id: UUID(), name: "A", description: "a", productResourceName: "a1", price: 1),
        .init(id: UUID(), name: "B", description: "b", productResourceName: "b1", price: 2),
        .init(id: UUID(), name: "C", description: "c", productResourceName: "c1", price: 3),
    ]
    
    override func defineSteps() {
        
        step("today is blackfriday") { [self] in
            productsRecommender = ProductRecommender(recommendationPolicy: .blackFriday)
        }
        
        step("all products should be recommended") { [self] in
            let allRecommendationResult = exampleProducts.allSatisfy { product -> Bool in
                productsRecommender.shouldRecommend(product: product, for: user)
            }
            XCTAssertTrue(allRecommendationResult)
        }

    }
    
    
}

private extension String {
    static let featureFile = "product_recommendation.feature"
}
