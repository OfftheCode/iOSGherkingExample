//
//  ProductViewController.swift
//  GherkinTests
//
//  Created by Piotr Szadkowski on 09/02/2021.
//

import UIKit

class ProductViewController: UIViewController {
    
    // MARK: Properties
    
    private let product: Product
    private let user: UserProtocol
    private let productRecommender: ProductRecommendable
    
    var productView: ProductView { view as! ProductView }
    
    var recommendationResult: ProductRecommendationResult {
        productRecommender.shouldRecommend(product: product, for: user)
    }
    
    // MARK: Init
    
    init(for product: Product,
         withUser user: UserProtocol,
         productRecommender: ProductRecommendable = ProductRecommender()) {
        self.product = product
        self.user = user
        self.productRecommender = productRecommender
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func loadView() {
        view = ProductView() {
            print("Bought product!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productView.configure(with: ProductRepresentable(with: product, and: recommendationResult))
    }

}

