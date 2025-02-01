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
    private let productRepository = ProductRepository()
    
    @Published var product: ProductResponse?
    
    init(id: Int) {
        self.id = id
    }
    
    func getProduct() {
        Task {
            let result = await productRepository.getProductDetail(id: id)
            
            switch result {
            case .success(let response):
                withAnimation {
                    self.product = response
                }

            case .failure(let failure):
                print("ProductDetailViewModel Error: \(failure)")
            }
        }
    }
}
