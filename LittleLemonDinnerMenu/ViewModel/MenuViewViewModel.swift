//
//  MenuViewViewModel.swift
//  LittleLemonDinnerMenu
//
//  Created by Preet S Manocha on 8/24/23.
//

import Foundation


@Observable
class MenuViewViewModel {

    var foods: [MenuItem] = (1...12).map { MenuItem(price: Double.random(in: 4.99...21.99),
                                                                       title: "food \($0)",
                                                    menuCategory: .food,
                                                    numberOfOrders: Int.random(in: 1..<5),
                                                    ingredient: [.broccoli, .carrot, .pasta])}
    var drinks: [MenuItem] = (1...8).map { MenuItem(price: Double.random(in: 4.99...21.99),
                                                     title: "Drinks \($0)",
                                                     menuCategory: .drink,
                                                    numberOfOrders: Int.random(in: 1..<5),
                                                     ingredient: [])}

    var desserts: [MenuItem] = (1...4).map { MenuItem(price: Double.random(in: 4.99...21.99),
                                                      title: "Desserts \($0)",
                                                      menuCategory: .dessert,
                                                      numberOfOrders: Int.random(in: 1..<3),
                                                      ingredient: [])}

    var isOptionsViewPresented = false
    var selectedCategories: Set<MenuCategory> = [.food, .drink, .dessert]

    func item(for category: MenuCategory) -> [MenuItem] {
        switch category {
            case .food:
                return foods
            case .dessert:
                return desserts
            case .drink:
                return drinks

        }
    }


}
