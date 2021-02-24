//
//  Product.swift
//  GherkinTests
//
//  Created by Piotr Szadkowski on 24/02/2021.
//

import UIKit

typealias Price = Float

struct Product {
    let id: UUID
    let name: String
    let description: String
    let productResourceName: String
    let price: Price
    
    static let mock = Product(id: UUID(),
                              name: "Amazing Plant",
                              description: "Maybe you wonder why should you buy this plant? Well me too, tho I would like you to focus on the presentation ^^. Anyways thanks for your time, hope you're having fun!",
                              productResourceName: "plant",
                              price: 14.0)
}
