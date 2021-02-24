//
//  ProductView.swift
//  GherkinTests
//
//  Created by Piotr Szadkowski on 24/02/2021.
//

import UIKit

typealias Tap = (() -> ())

class ProductView: UIView {
    
    // MARK: Properties
    
    var addProductAction: Tap
    lazy var productLayoutGuide = UILayoutGuide()
    
    private let verticalPadding: CGFloat = 16
    
    // MARK: Subviews
    
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var recomendationIconImage: UIImageView = {
       let imageView = UIImageView(image: UIImage(systemName: "eyes"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemRed
        imageView.isHidden = true
        return imageView
    }()
    
    lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.33
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addProductButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .highlighted)
        button.addTarget(self, action: #selector(handleAddProductButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Init
    
    init(addProductAction: @escaping Tap) {
        self.addProductAction = addProductAction
        super.init(frame: .zero)
        setupLayout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    
    private func setupLayout() {
        backgroundColor = .white
        addLayoutGuide(productLayoutGuide)
        addSubviews(productImage, productTitleLabel, productDescriptionLabel, addProductButton, recomendationIconImage)
        
        NSLayoutConstraint.activate([
            productLayoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productLayoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16
            ),
            
            productImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            productImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            productImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            productImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            
            productTitleLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: verticalPadding),
            productTitleLabel.leadingAnchor.constraint(equalTo: productLayoutGuide.leadingAnchor),
            productTitleLabel.trailingAnchor.constraint(equalTo: recomendationIconImage.leadingAnchor, constant: -8),
            
            recomendationIconImage.centerYAnchor.constraint(equalTo: productTitleLabel.centerYAnchor),
            recomendationIconImage.trailingAnchor.constraint(equalTo: productLayoutGuide.trailingAnchor),
            recomendationIconImage.widthAnchor.constraint(equalToConstant: 22),
            recomendationIconImage.heightAnchor.constraint(equalToConstant: 22),
            
            productDescriptionLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: verticalPadding),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: productLayoutGuide.leadingAnchor),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: productLayoutGuide.trailingAnchor),
            productDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: addProductButton.topAnchor, constant: -verticalPadding),
            
            addProductButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -verticalPadding),
            addProductButton.leadingAnchor.constraint(equalTo: productLayoutGuide.leadingAnchor),
            addProductButton.trailingAnchor.constraint(equalTo: productLayoutGuide.trailingAnchor),
            addProductButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    // MARK: Actions
    
    @objc private func handleAddProductButtonTapped() {
        
    }
    
    func configure() {
        productImage.image = UIImage(named: "plant")
        productTitleLabel.text = "Amazing Plant"
        productDescriptionLabel.text = "Maybe you wonder why should you buy this plant? Well me too, tho I would like you to focus on the presentation ^^. Anyways thanks for your time, hope you're having fun!"
        addProductButton.setTitle("Buy for 14$", for: .normal)
        recomendationIconImage.isHidden = false
    }
    
}

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
    
}
