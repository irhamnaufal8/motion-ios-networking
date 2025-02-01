//
//  HomeViewModel.swift
//  DummyJSON
//
//  Created by Irham Naufal on 01/02/25.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    
    private let productRepository = ProductRepository()
    
    @Published var categories: [CategoryResponse] = []
    @Published var currentCategory = "All"
    
    @Published var products: [ProductResponse] = []
    
    init() {
        getCategories()
        getProductList()
    }
    
    func getCategories() {
        Task {
            // TODO: Implementation
        }
    }
    
    func getProductList() {
        Task {
            // TODO: Implementation
        }
    }
    
    func getProductListByCategory(_ category: String) {
        Task {
            // TODO: Implementation
        }
    }
}
