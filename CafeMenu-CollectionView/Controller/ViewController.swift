//
//  ViewController.swift
//  CafeMenu-CollectionView
//


import UIKit

class ViewController: UIViewController {
    
    let columns = 3
    var sections:[[MenuItem]]?
    var menu = Menu(){
        didSet{
            sections?[0] = menu.drinks
            sections?[1] = menu.foods
            sections?[2] = menu.merchAndOthers
        }
    }
    
    //MARK: UI Component Declarations
    
    let bannerView:BannerView = {
        let view = BannerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var collectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let emptySpace =  10 * (columns + 1)
        let width = ( view.frame.width - CGFloat(emptySpace))/3
     
        layout.itemSize = CGSize(width:width, height:width*1.25)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame:.zero, collectionViewLayout:layout)
        collectionView.backgroundColor = UIColor(named:"Cream")
        collectionView.layer.cornerRadius = 30
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.identifier)
        collectionView.collectionViewLayout  = layout
        return collectionView
    }()
    
    // MARK: View LifeCycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = [menu.drinks, menu.foods, menu.merchAndOthers]
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubViews()
    }
    override func viewDidLayoutSubviews() {
        setUpUI()
    }
    private func addSubViews(){
        view.addSubview(bannerView)
        view.addSubview(collectionView)
    }
   
    private func setUpUI(){
        
        view.layoutIfNeeded()
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 190)
        ])
        view.layoutIfNeeded()
        NSLayoutConstraint.activate ([
            collectionView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant:0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor
                                                    , constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections?.count ?? 0
    }
}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let section = self.sections?[section]
        return section?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as?  ItemCell else {
            return UICollectionViewCell()
        }
        let section = indexPath.section
        let item = sections?[section][indexPath.item]
        
        if let item = item{
            if let image = UIImage(named:item.imageName){
                cell.imageView.image = image
            }
            cell.priceLabel.text = String(format: "$%.2f", item.price)
            cell.nameLabel.text = item.name
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier, for:indexPath) as? HeaderView else{
            return UICollectionReusableView()
        }
        
        var name = "none"
        switch indexPath.section {
        case 0:
            name = "Drinks"
        case 1:
            name = "Foods"
        case 2:
            name = "Merch/Others"
        default:
            name = "Unknown"
            
        }
        
        headerView.headerName = name
        return headerView
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:view.frame.size.width, height:77)
        
    }
}
