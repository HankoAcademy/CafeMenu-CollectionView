//
//  ViewController.swift
//  CafeMenu-CollectionView
//
//  Created by Hannie Kim on 9/24/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
    // MARK: -  Class Properties
    private var menu = Menu()
    private var contentView: ContentView!
    private var collectionView: UICollectionView!
    
    // MARK: -  Lifecycle
    
    override func loadView() {
        contentView = ContentView()
        view = contentView
        
        collectionView = contentView.collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: -  UICollectionViewDataSource Protocol Conformance Methods
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailCollectionViewCell.identifier, for: indexPath) as? ProductDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch ProductType(rawValue: indexPath.section) {
        case .drinks:
            let drinks = menu.drinks[indexPath.row]
            cell.configure(name: drinks.name, price: drinks.price, image: drinks.imageName)
            return cell
        case .foods:
            let foods = menu.foods[indexPath.row]
            cell.configure(name: foods.name, price: foods.price, image: foods.imageName)
            return cell
        case .merchAndOthers:
            let merch = menu.merchAndOthers[indexPath.row]
            cell.configure(name: merch.name, price: merch.price, image: merch.imageName)
            return cell
        case .none:
            return UICollectionViewCell()
        }
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
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ProductType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else {
                return UICollectionReusableView()
            }
            
            switch ProductType(rawValue: indexPath.section) {
            case .drinks:
                headerView.configure(headerText: "Drinks")
            case .foods:
                headerView.configure(headerText: "Food")
            case .merchAndOthers:
                headerView.configure(headerText: "Merch")
            case .none:
                return UICollectionReusableView()
            }
            return headerView
        }
        //  Footer
        //  else if kind == UICollectionView.elementKindSectionFooter {
        //            guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as? FooterCollectionReusableView else {
        //                return UICollectionReusableView()
        //            }
        //
        //            switch ProductType(rawValue: indexPath.section) {
        //            case .drinks:
        //                footerView.configure(headerText: "Drinks")
        //            case .foods:
        //                footerView.configure(headerText: "Food")
        //            case .merchAndOthers:
        //                footerView.configure(headerText: "Merch")
        //            case .none:
        //                return UICollectionReusableView()
        //            }
        //            return footerView
        //        }
        return UICollectionReusableView()
    }
    
    // MARK: -  UICollectionViewDelegate Protocol Conformance Methods
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) Row: \(indexPath.row)")
    }
}

// MARK: -  Delegate Protocol Conformance Methods

extension ViewController: UICollectionViewDelegateFlowLayout {
    // Method for Section Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
    // Function for Section Footer
    // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //        return CGSize(width: view.frame.size.width, height: 50)
    //    }
}
