//
//  NetworkService.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import Foundation

final class NetworkService: ObservableObject {
    
    static let shared = NetworkService()
    
    private init() {}
    
    @MainActor
    func downloadData() async -> [Product]? {
        return Product.mockData()
    }
}
