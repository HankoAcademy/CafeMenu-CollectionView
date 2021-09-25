//
//  ViewController.swift
//  CafeMenu-CollectionView
//
//  Created by Hannie Kim on 9/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var menuCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        
        collectionViewFlowLayout.minimumLineSpacing = 20
        collectionViewFlowLayout.minimumInteritemSpacing = 10
                
//        collectionViewFlowLayout.itemSize = CGSize(width: view.frame.size.width/3-4, height: view.frame.size.width/3-4)
        
        collectionViewFlowLayout.itemSize = CGSize(width: view.frame.size.width/3-15, height: view.frame.size.width/2.5)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(MenuItemCollectionViewCell.self, forCellWithReuseIdentifier: MenuItemCollectionViewCell.identifier)
        
        // Before we use a custom cell
        // collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MenuItemCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpUI()
    }

    private func setUpUI() {
        
        view.backgroundColor = .white
        
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        
        view.addSubview(menuCollectionView)
        
        NSLayoutConstraint.activate([
            menuCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Before we create a custom cell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCell", for: indexPath)
        
        // After we create a custom cell
        
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCell", for: indexPath) as? MenuItemCollectionViewCell else {
             assertionFailure("Expected to dequeue \(MenuItemCollectionViewCell.self) but found nil")
             return UICollectionViewCell()
         }
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        return UICollectionReusableView()
//    }
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 200)
//    }
//
//}

extension ViewController: UICollectionViewDelegate {
        
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return
//    }
}
