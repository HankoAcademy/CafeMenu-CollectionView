//
//  MenuItemCollectionViewCell.swift
//  CafeMenu-CollectionView
//
//  Created by Hannie Kim on 9/25/21.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuItemCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(named: "Navy")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Round Corners
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        
        // Shadow
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        
        backgroundColor = UIColor(named: "MochaBrown")
        
        addSubviews()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
    private func setUpUI() {
        // Round Corners
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        
        // Shadow
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        
        // Set contentView's background color
        contentView.backgroundColor = UIColor(named: "MochaBrown")
    }
    
    private func addSubviews() {
        imageContainerView.addSubview(imageView)
        contentView.addSubview(imageContainerView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
    }
    
    let imageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Cream")
        view.layer.cornerRadius = 30
        return view
    }()
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([            
            imageContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.40),
            
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: -8),
            imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    func configure(imageName: String, titleText: String, price: Double) {
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        priceLabel.text = String(format: "$%.02f", price)
    }
}
