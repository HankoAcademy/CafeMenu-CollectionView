//
//  itemCell.swift
//  CafeMenu-CollectionView
//
//  Created by Victoria Park on 10/2/21.
//

import UIKit

class ItemCell: UICollectionViewCell {
    static let identifier = "ItemCell"
    
    private let mainStack:UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        
        stack.distribution = .fillProportionally
        stack.alignment = .center
        return stack
    }()
    
    lazy var imageBackingView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var imageView:UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
       
        imageView.backgroundColor = .white
        return imageView
    }()
    
    let textStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight:.medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
        
    }()
    lazy var priceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight:.light)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: Initializers
    
    override init(frame:CGRect){
        super.init(frame:frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        setUpUI()
    }
    private func setUpUI(){
   
        self.contentView.addSubview(mainStack)
        
        mainStack.addArrangedSubview(imageBackingView)
    //    mainStack.addArrangedSubview(nameLabel)
    //    mainStack.addArrangedSubview(priceLabel)
        mainStack.addArrangedSubview(textStack)
        textStack.addArrangedSubview(nameLabel)
        textStack.addArrangedSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: self.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        mainStack.backgroundColor = .brown
        mainStack.layer.cornerRadius = mainStack.frame.width/4
        
        imageBackingView.layer.cornerRadius = imageBackingView.frame.width/2.5
         NSLayoutConstraint.activate([
            imageBackingView.topAnchor.constraint(equalTo: mainStack.topAnchor, constant: 10),
            imageBackingView.widthAnchor.constraint(equalTo:self.widthAnchor, multiplier:0.7),
            imageBackingView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45)
            
         ])
        imageBackingView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageBackingView.widthAnchor, multiplier: 0.6),
            imageView.heightAnchor.constraint(equalTo: imageBackingView.heightAnchor, multiplier: 0.8),
            imageView.centerXAnchor.constraint(equalTo: imageBackingView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageBackingView.centerYAnchor)
        ])
        imageView.layer.cornerRadius = imageView.frame.width/2.5
        NSLayoutConstraint.activate([
            textStack.bottomAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: -10)
        ])
         
    }
    
}
