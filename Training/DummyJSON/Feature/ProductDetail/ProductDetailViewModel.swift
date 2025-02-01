//
//  ProductDetailViewModel.swift
//  DummyJSON
//
//  Created by Irham Naufal on 02/02/25.
//

import SwiftUI

@MainActor
final class ProductDetailViewModel: ObservableObject {
    
    private let id: Int
    
    // TODO: Add `ProductRepository`
    
    @Published var product: ProductResponse?
    
    init(id: Int) {
        self.id = id
    }
    
    func getProduct() {
        Task {
            // TODO: Implementation
        }
    }
}
