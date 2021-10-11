//
//  ProductDetailCollectionViewCell.swift
//  CafeMenu-CollectionView
//
//  Created by Diana Ruiz-Olvera on 10/8/21.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductDetailCell"
    
    //MARK: - UI Component Declarations
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(named: "MochaBrown")
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.layer.borderWidth = 0.0
        stackView.layer.shadowColor = UIColor.systemGray.cgColor
        stackView.layer.shadowOffset = CGSize(width: 0, height: 5)
        stackView.layer.shadowRadius = 4
        stackView.layer.shadowOpacity = 1
        stackView.layer.cornerRadius = 20
        stackView.layer.masksToBounds = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(named: "Cream")
        return label
    }()
    
    private let iconBackgroundView: UIStackView = {
        let iconBackgroundView = UIStackView()
        iconBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        iconBackgroundView.backgroundColor = UIColor(named: "Cream")
        iconBackgroundView.axis = .vertical
        iconBackgroundView.alignment = .center
        iconBackgroundView.distribution = .fillProportionally
        iconBackgroundView.layer.cornerRadius = 25
        return iconBackgroundView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named: "Cream")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Cream")
        setUpUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setUpUI() {
        
        contentView.backgroundColor = UIColor(named: "Cream")

        stackView.addArrangedSubview(iconBackgroundView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        
        iconBackgroundView.addArrangedSubview(imageView)
        contentView.addSubview(stackView)
    
        NSLayoutConstraint.activate([
            iconBackgroundView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
            iconBackgroundView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            iconBackgroundView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -80),
            iconBackgroundView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }
    
    func configure(name: String, price: Double, image: String) {
        titleLabel.text = name
        priceLabel.text = String(format: "$%.02f", price)
        imageView.image = UIImage(named: image)
    }
    
}
