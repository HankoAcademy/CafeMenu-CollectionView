//
//  ContentView.swift
//  CafeMenu-CollectionView
//
//  Created by Diana Ruiz-Olvera on 10/10/21.
//

import UIKit

class ContentView: UIView {
    
    // MARK: -  UI Properties
    
    let menu: Menu
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 110, height: 150)
        //layout.itemSize = CGSize(width: self.frame.size.width/3.5, height:          self.frame.size.height/6)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProductDetailCollectionViewCell.self, forCellWithReuseIdentifier: ProductDetailCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        // Code to Register Footer
        // collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind:    UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        return collectionView
    }()
    
    // MARK: - UI Components for Header
    
    let headerStackView: UIStackView = {
        let headerStackView = UIStackView()
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.axis = .horizontal
        headerStackView.distribution = .fillProportionally
        headerStackView.spacing = 10
        return headerStackView
    }()
    
    let mainHeaderView: UIView = {
        let mainHeaderView = UIView()
        mainHeaderView.translatesAutoresizingMaskIntoConstraints = false
        mainHeaderView.backgroundColor = .white
        return mainHeaderView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo_coffee")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let mainHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Coffee Code </> Espresso Bar"
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: -  Initializers
    
    override init(frame: CGRect = .zero) {
        self.menu = Menu()
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        backgroundColor = .white
        addSubview(headerStackView)
        headerStackView.addArrangedSubview(logoImageView)
        headerStackView.addArrangedSubview(mainHeaderLabel)

        collectionView.backgroundColor = UIColor(named: "Cream")
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            headerStackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
            
            collectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
