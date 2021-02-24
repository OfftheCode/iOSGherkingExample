//
//  User.swift
//  GherkinTests
//
//  Created by Piotr Szadkowski on 24/02/2021.
//

import Foundation

typealias Hobby = String

protocol UserProtocol {
    var id: UUID { get }
    var hobbys: [Hobby] { get set }
}

struct User: UserProtocol {
    let id: UUID
    var hobbys: [Hobby]
    
    static let mock = User(id: UUID(), hobbys: ["Food", "Netflix", "Sleep", "Plant"])
}
