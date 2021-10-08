//
//  MenuItemDetailCollectionViewCell.swift
//  CafeMenu-CollectionView
//
//  Created by Christian on 10/5/21.
//

import UIKit

class MenuItemDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuItemDetailCell"
    
    private let menuItemIconView: MenuItemIconView = {
       let view = MenuItemIconView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        return view
    }()
    
    private let itemName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
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
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.backgroundColor = UIColor.white.cgColor
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        contentView.layer.shadowRadius = 2.0
        contentView.layer.shadowOpacity = 1.0
        
        contentView.backgroundColor = UIColor(named: "MochaBrown")
        
        contentView.addSubview(menuItemIconView)
        contentView.addSubview(itemName)
        contentView.addSubview(itemPrice)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            menuItemIconView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            menuItemIconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            menuItemIconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            menuItemIconView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
            
            
            itemName.topAnchor.constraint(equalTo: menuItemIconView.bottomAnchor, constant: 8),
            itemName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemName.bottomAnchor.constraint(equalTo: itemPrice.topAnchor),
            
            itemPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            itemPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func configure(imageName: String, name: String, price: Double) {
        menuItemIconView.itemImage = imageName
        itemName.text = name
        itemPrice.text = String(format: "$%.02f", price)
    }
    
}
 
