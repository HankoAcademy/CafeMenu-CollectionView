//
//  Food.swift
//  CafeApp
//
//  Created by Mayuko Inoue on 9/9/21.
//

import Foundation

struct Food: MenuItem {
    
    var imageName: String
    var name: String
    var description: String
    var price: Double
    var type: ProductType = .foods
    
    init(withImageName imageName: String, withName name: String, withDescription description: String, withPrice price: Double) {
        self.imageName = imageName
        self.name = name
        self.description = description
        self.price = price        
    }
}
