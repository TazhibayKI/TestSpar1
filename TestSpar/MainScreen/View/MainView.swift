//
//  MainView.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var vm: MainViewVM
    
    var body: some View {
        
        //Product Section
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(vm.allProducts, id: \.id) { product in
                NavigationLink(value: product) {
                    ProductRow(product: product)
                }
                .padding(.bottom, 20) //Отступ в самой секции
            }
            .padding(.top, 20) // Если добавить к скроллвью, то оно скрывает
        }
        .padding(.horizontal)
        .onAppear {
            Task {
                await vm.fetchData()
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
            .environmentObject(MainViewVM())
    }
}

