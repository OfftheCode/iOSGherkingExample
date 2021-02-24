//
//  ProductRecommender.swift
//  GherkinTests
//
//  Created by Piotr Szadkowski on 24/02/2021.
//

import Foundation

typealias ProductRecommendationResult = Bool

protocol ProductRecommendable {
    func shouldRecommend(product: Product, for user: UserProtocol) -> ProductRecommendationResult
}

class ProductRecommender: ProductRecommendable {
    
    enum CompanyRecommendationPolicy {
        case `default`
        case blackFriday
    }
    
    private let recommendationPolicy: CompanyRecommendationPolicy
    
    init(recommendationPolicy: CompanyRecommendationPolicy = .default) {
        self.recommendationPolicy = recommendationPolicy
    }
    
    func shouldRecommend(product: Product, for user: UserProtocol) -> ProductRecommendationResult {
        guard recommendationPolicy == .default else { return true }
        return product.name.lowercased().components(separatedBy: " ")
            .first(where: { user.hobbys.map { $0.lowercased() }.contains($0)} ) != nil
    }
    
}
