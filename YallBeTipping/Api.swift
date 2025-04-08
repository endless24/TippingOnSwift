//
//  Api.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 12/02/2025.
//

import Foundation

class Api {
    static let shared = Api()
    private init(){}
    
    func fetchApiData() -> [MenuItem]{
        return [
            MenuItem(name: "Burger", price: 12.5, img: "Burger"),
            MenuItem(name: "Chow mein", price: 30.3, img: "Chowmein"),
            MenuItem(name: "Dumplings", price: 25.3, img: "Dumplings"),
            MenuItem(name: "fried Chicken", price: 15.0, img: "FriedChicken"),
            MenuItem(name: "Pizza", price: 18.5, img: "Pizza"),
            MenuItem(name: "Spaghetti", price: 10.9, img: "Spaghetti"),
            MenuItem(name: "Fried Bread", price: 17.4, img: "friedbread"),
            MenuItem(name: "Steak", price: 13.8, img: "Steak"),
            MenuItem(name: "sushi", price: 21.2, img: "sushi"),
            MenuItem(name: "Ice Cream", price: 21.2, img: "IceCream"),
            
        ]
    }
}
