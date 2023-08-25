//
//  LittleLemonDinnerMenuTests.swift
//  LittleLemonDinnerMenuTests
//
//  Created by Preet S Manocha on 8/24/23.
//

import XCTest
@testable import LittleLemonDinnerMenu

final class LittleLemonDinnerMenuTests: XCTestCase {

    let viewModel = MenuViewViewModel()

    func test_itemTitle() throws {
        let item = viewModel.drinks[3]
        XCTAssertEqual(item.title.capitalized, "Drink 4")
    }

    func test_itemIngredients() throws {
        let foodIngredients = viewModel.foods[2]
        XCTAssertNotEqual(foodIngredients.ingredient, [.broccoli, .carrot])
    }

}
