//
//  ViewController.swift
//  CafeMenu-CollectionView
//
//  Created by Hannie Kim on 9/24/21.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Class Properties
    
    let menu: Menu
    
    // MARK: - UI Properties
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/3.5, height: view.frame.size.width/3)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuItemDetailCollectionViewCell.self, forCellWithReuseIdentifier: "MenuItemDetailCell")
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MenuItemHeader")
        return collectionView
    }()
    
    // MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpUI()
    }
    
    init(menu: Menu) {
        self.menu = menu
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
}

extension MenuViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemDetailCollectionViewCell.identifier, for: indexPath) as? MenuItemDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch MenuItems(rawValue: indexPath.section) {
        case .drinks:
            let drink = menu.drinks[indexPath.row]
            cell.configure(imageName: drink.imageName, name: drink.name, price: drink.price)
            return cell
        case .foods:
            let food = menu.foods[indexPath.row]
            cell.configure(imageName: food.imageName, name: food.name, price: food.price)
            return cell
        case .merchAndOthers:
            let merch = menu.merchAndOthers[indexPath.row]
            cell.configure(imageName: merch.imageName, name: merch.name, price: merch.price)
            return cell
        case .none:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch MenuItems(rawValue: section) {
        case .drinks:
            return menu.drinks.count
        case .foods:
            return menu.foods.count
        case .merchAndOthers:
            return menu.merchAndOthers.count
        case .none:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        
        switch MenuItems(rawValue: indexPath.section) {
        case .drinks:
            headerView.configure(header: "Drinks")
        case .foods:
            headerView.configure(header: "Foods")
        case .merchAndOthers:
            headerView.configure(header: "Merch • Others")
        case .none:
            return UICollectionReusableView()
        }
        
        return headerView
    }
}

extension MenuViewController: UICollectionViewDelegate {
    
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
}
