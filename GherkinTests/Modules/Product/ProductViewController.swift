//
//  ProductViewController.swift
//  GherkinTests
//
//  Created by Piotr Szadkowski on 09/02/2021.
//

import UIKit

class ProductViewController: UIViewController {

    override func loadView() {
        view = ProductView() { print("XD") }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

