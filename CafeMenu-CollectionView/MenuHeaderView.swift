//
//  MenuHeaderView.swift
//  CafeMenu-CollectionView
//
//  Created by Christian on 10/7/21.
//

import UIKit

class MenuHeaderView: UIStackView {
    
    //MARK: - UI Properties

    let headerLogoView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo_coffee")
        view.image?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .white
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Christian's Cafe"
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Up UI
    
    private func setUpUI() {
        axis = .horizontal
        spacing = 20
        distribution = .fillProportionally
        
        addArrangedSubview(headerLogoView)
        addArrangedSubview(headerLabel)
        
        setUpConstraints()
    }
    
    //MARK: - Set Up Constraints
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            headerLogoView.heightAnchor.constraint(equalToConstant: 90),
            headerLogoView.widthAnchor.constraint(equalTo: headerLogoView.heightAnchor),
        ])
    }
    
}
