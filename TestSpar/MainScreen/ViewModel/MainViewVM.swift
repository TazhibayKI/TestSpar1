//
//  MainViewVM.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import Foundation

class MainViewVM: ObservableObject {
    
    @Published private(set) var allProducts: [Product] = []
    
    @Published var quantity = 0
    @Published var selectedUnitIndex = 0
    
    @MainActor
    func fetchData() async {
        guard let downloadedProduct: [Product] = await NetworkService.shared.downloadData() else { return }
        //Можем выполнить сортировку
        allProducts = downloadedProduct
    }
}
