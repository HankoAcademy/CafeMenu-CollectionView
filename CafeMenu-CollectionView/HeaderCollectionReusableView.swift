//
//  HeaderCollectionReusableView.swift
//  CafeMenu-CollectionView
//
//  Created by Christian on 10/6/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "MenuItemHeader"
    
    private let headerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let bottomBorderView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Navy")
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
        addSubview(headerLabel)
        addSubview(bottomBorderView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomBorderView.topAnchor, constant: -16),
            
            bottomBorderView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            bottomBorderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomBorderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomBorderView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configure(header: String) {
        let attributedString = NSMutableAttributedString(string: header)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
        headerLabel.attributedText = attributedString
    }
    
}
