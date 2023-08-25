//
//  MenuItemsView.swift
//  LittleLemonDinnerMenu
//
//  Created by Preet S Manocha on 8/24/23.
//

import SwiftUI

struct MenuItemsView: View {
    @State var viewModel = MenuViewViewModel()
    

    var body: some View {
            NavigationStack {
                GeometryReader { geometry in
                    let threeColumnLayout = [GridItem(.adaptive(minimum: geometry.size.width / 4))]
                    ScrollView {
                        ForEach(MenuCategory.allCases.filter(viewModel.selectedCategories.contains), id: \.self) { category in
                            ItemView(item: viewModel.item(for: category), gridSize: threeColumnLayout)
                        }
                    }
                }
                .padding()
                .navigationTitle("Menu")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    Button(action: {
                        viewModel.isOptionsViewPresented.toggle()
                    }, label: {
                        Image(systemName: Constants.settingsToolbar)
                    })
                }
                .sheet(isPresented: $viewModel.isOptionsViewPresented) {
                    MenuItemsOptionView(isPresented: $viewModel.isOptionsViewPresented, viewModel: viewModel)
                }
            }
    }
}
#Preview {
    MenuItemsView()
}

struct ItemView: View {
    @Environment(\.colorScheme) var colorScheme

    var item: [MenuItem]
    var gridSize: [GridItem]

    var body: some View {
        VStack{
            HStack {
                Text(item.first?.menuCategory.rawValue ?? "Nil")
                    .font(.title)
                Spacer()
            }
            LazyVGrid(columns: gridSize) {
                ForEach(item, id:\.self) { item in
                    NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                        VStack{
                            Rectangle()
                                .frame(height: 100)
                            Text(item.title.capitalized)
                        }.foregroundStyle(colorScheme == .dark ? .gray : .black)
                    }

                }
            }
        }
    }
}
