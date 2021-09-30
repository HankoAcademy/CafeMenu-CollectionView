//
//  MenuViewController.swift
//  CafeMenu-CollectionView
//
//  Created by Hannie Kim on 9/24/21.
//

import UIKit

class MenuViewController: UIViewController {
    
    enum ProductType: Int, CaseIterable {
        case drinks, foods, merchAndOthers
    }
    
    // MARK: - Class Properties
    
    let menu: Menu
    
    // MARK: - UI Setup Functions
    
    lazy var menuCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        
        collectionViewFlowLayout.minimumLineSpacing = 20
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionViewFlowLayout.itemSize = CGSize(width: view.frame.size.width/3-15, height: view.frame.size.width/2.5)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layer.cornerRadius = 20
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        collectionView.backgroundColor = UIColor(named: "Cream")
        collectionView.register(MenuItemCollectionViewCell.self, forCellWithReuseIdentifier: MenuItemCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        return collectionView
    }()
    
    let menuHeaderView: MenuHeaderView = {
        let headerView = MenuHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    // MARK: - Initializers
    
    init(menu: Menu) {
        self.menu = menu
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setUpUI()
    }

    // MARK: - UI Setup Functions
    
    private func setUpUI() {
        
        view.backgroundColor = .white
        
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        
        view.addSubview(menuHeaderView)
        view.addSubview(menuCollectionView)
        
        NSLayoutConstraint.activate([
            menuHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            menuHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            
            menuCollectionView.topAnchor.constraint(equalTo: menuHeaderView.bottomAnchor, constant: 20),
            menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource Methods

extension MenuViewController: UICollectionViewDataSource {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ProductType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch ProductType(rawValue: section) {
        case .drinks:
            return menu.drinks.count
        case .foods:
            return menu.foods.count
        case .merchAndOthers:
            return menu.merchAndOthers.count
        case .none:
            assertionFailure("Error: Only sections for drinks, foods, or merch are expected")
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCell", for: indexPath) as? MenuItemCollectionViewCell else {
            assertionFailure("Expected to dequeue \(MenuItemCollectionViewCell.self) but found nil")
            return UICollectionViewCell()
        }
        
        switch ProductType(rawValue: indexPath.section) {
        case .drinks:
            let drink = menu.drinks[indexPath.row]            
            cell.configure(imageName: drink.imageName, titleText: drink.name, price: drink.price)
            return cell
        case .foods:
            let food = menu.foods[indexPath.row]
            cell.configure(imageName: food.imageName, titleText: food.name, price: food.price)
            return cell
        case .merchAndOthers:
            let merch = menu.merchAndOthers[indexPath.row]
            cell.configure(imageName: merch.imageName, titleText: merch.name, price: merch.price)
            return cell
        case .none:
            assertionFailure("Error: Product type for section unexpectedly nil")
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else {
            assertionFailure("Could not dequeue \(HeaderCollectionReusableView.self)")
            return UICollectionReusableView()
        }
        
        switch ProductType(rawValue: indexPath.section) {
        case .drinks:
            headerView.configure(headerText: "Drinks")
        case .foods:
            headerView.configure(headerText: "Food")
        case .merchAndOthers:
            headerView.configure(headerText: "Merch • Other")
        case .none:
            assertionFailure("Error: Product type for section unexpectedly nil")
            return UICollectionReusableView()
        }
        
        return headerView
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
}
