//
//  MenuItemsOptionView.swift
//  LittleLemonDinnerMenu
//
//  Created by Preet S Manocha on 8/24/23.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @Binding var isPresented: Bool
    @Bindable var viewModel: MenuViewViewModel
    @State private var selectedSortBy: SortBy? = nil

    var body: some View {
        NavigationStack {
            List {
                // selected category selection
                Section("Selected categories") {
                    ForEach(MenuCategory.allCases, id: \.self ) { category in
                        HStack {
                            Text(category.rawValue)
                            Spacer()
                            if viewModel.selectedCategories.contains(category) {
                                Image(systemName: "checkmark")
                            }
                        }
                        .onTapGesture {
                            if viewModel.selectedCategories.contains(category) {
                                viewModel.selectedCategories.remove(category)
                            } else {
                                viewModel.selectedCategories.insert(category)
                            }
                        }
                    }
                }
                // section sortBy
                Section("Sort By") {
                    ForEach(SortBy.allCases, id: \.self) { sortBy in
                        HStack {
                            Text(sortBy.rawValue)
                            Spacer()
                            if selectedSortBy == sortBy {
                                Image(systemName: Constants.checkMarkImage)
                            }
                        }
                        .onTapGesture {
                            selectedSortBy = sortBy
                        }
                    }
                }
            }
            .toolbar {
                Button("Done") {
                    isPresented = false
                }

            }
        }
    }
}


#Preview {
    MenuItemsOptionView(isPresented: MenuItemsView().$viewModel.isOptionsViewPresented, viewModel: MenuViewViewModel())
}
