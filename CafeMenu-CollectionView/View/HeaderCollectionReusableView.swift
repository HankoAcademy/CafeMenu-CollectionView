//
//  HeaderCollectionReusableView.swift
//  CafeMenu-CollectionView
//
//  Created by Diana Ruiz-Olvera on 10/8/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "ProductHeader"
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "Cream")
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        headerLabel.backgroundColor = UIColor(named: "Cream")
        addSubview(headerLabel)
        addSubview(divider)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 0),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configure(headerText: String) {
        let attributedString = NSMutableAttributedString(string: headerText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 13, range: NSRange(location: 0, length: attributedString.length))
        headerLabel.attributedText = attributedString
    }
}
//
//class FooterCollectionReusableView: UICollectionReusableView {
//
//    static let identifier = "ProductFooter"
//
//    private let headerLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        label.textColor = .black
//        label.textAlignment = .left
//        return label
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setUpUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setUpUI() {
//        addSubview(headerLabel)
//
//        NSLayoutConstraint.activate([
//            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
//            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
//            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//        ])
//    }
//
//    func configure(headerText: String) {
//        let attributedString = NSMutableAttributedString(string: headerText)
//        attributedString.addAttribute(NSAttributedString.Key.kern, value: 13, range: NSRange(location: 0, length: attributedString.length))
//        headerLabel.attributedText = attributedString
//    }
//}
//
