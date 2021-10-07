//
//  MenuItemIconView.swift
//  CafeMenu-CollectionView
//
//  Created by Christian on 10/5/21.
//

import Foundation
import UIKit

class MenuItemIconView: UIView {
    
    var itemImage: String = "" {
        didSet {
            menuItemImage.image = UIImage(named: itemImage)
        }
    }
    
    private let menuItemImage: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image?.withRenderingMode(.alwaysTemplate)
            view.tintColor = .white
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        backgroundColor = UIColor(named: "Cream")
        
        addSubview(menuItemImage)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            menuItemImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            menuItemImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuItemImage.heightAnchor.constraint(equalToConstant: 40),
            menuItemImage.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}