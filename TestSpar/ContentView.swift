//
//  ContentView.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = MainViewVM()

    init() {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                MainView()
                    .navigationDestination(for: Product.self) { product in
                        ProductDetailView(product: product)
                    }
            }
            .environmentObject(vm)
            .tabItem {
                Image(systemName: "circle.dotted.circle")
                Text("Главная")
            }
            
            CatalogView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Каталог")
                }
            
            TrashView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Корзина")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Профиль")
                }
        }
    }
}

#Preview {
    ContentView()
}
