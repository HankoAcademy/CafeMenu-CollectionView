//
//  HeaderCollectionReusableView.swift
//  CafeMenu-CollectionView
//
//  Created by Hannie Kim on 9/25/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Class Properties
    
    static let identifier = "MenuItemHeader"
    
    // MARK: - UI Component Declarations
    
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left        
        return label
    }()
    
    private var bottomLineView: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(named: "Navy")
        return line
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup Functions
    
    private func setupUI() {
        
        backgroundColor = UIColor(named: "Cream")
        
        addSubview(headerLabel)
        addSubview(bottomLineView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            headerLabel.bottomAnchor.constraint(equalTo: bottomLineView.topAnchor, constant: -5),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomLineView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configure(headerText: String) {
        
        let attributedString = NSMutableAttributedString(string: headerText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
        headerLabel.attributedText = attributedString
    }
}
