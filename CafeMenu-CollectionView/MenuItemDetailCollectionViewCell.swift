//
//  MenuItemDetailCollectionViewCell.swift
//  CafeMenu-CollectionView
//
//  Created by Christian on 10/5/21.
//

import UIKit

class MenuItemDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuItemDetailCell"
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    private let menuItemIconView: MenuItemIconView = {
       let view = MenuItemIconView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let itemName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        contentView.backgroundColor = UIColor(named: "MochaBrown")
        contentView.layer.cornerRadius = 20
        stackView.addArrangedSubview(menuItemIconView)
        stackView.addArrangedSubview(itemName)
        stackView.addArrangedSubview(itemPrice)
        
        
        contentView.addSubview(stackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func configure(imageName: String, name: String, price: Double) {
        menuItemIconView.itemImage = imageName
        itemName.text = name
        itemPrice.text = String(format: "$%.02f", price)
    }
    
}
 
