//
//  MenuItemDetailsView.swift
//  LittleLemonDinnerMenu
//
//  Created by Preet S Manocha on 8/24/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    var menuItem: MenuItem

    var body: some View {
        NavigationStack {
            VStack {
                Image(Constants.logoImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Price:")
                    .fontWeight(.bold)
                Text(String(format: "%.2f", menuItem.price))
                
                Text("Ordered:")
                    .fontWeight(.bold)
                Text("\(menuItem.numberOfOrders)")
                
                if menuItem.ingredient.count > 0 {
                    Text("Ingredients:")
                        .fontWeight(.bold)
                    ForEach(menuItem.ingredient, id: \.self) {
                        Text($0.rawValue)
                    }
                }
            }
            .padding(1)
        }
        .navigationTitle(menuItem.title.capitalized)
        .padding([.leading, .trailing], 60)
    }
}


#Preview {
    MenuItemDetailsView(menuItem: MenuItem(
        price: Double.random(in: 4.99...21.99),
        title: "food",
        menuCategory: .food,
        numberOfOrders: Int.random(in: 1..<5),
        ingredient: [.broccoli, .carrot, .pasta])
    )
}
