//
//  ProductRepository.swift
//  DummyJSON
//
//  Created by Irham Naufal on 02/02/25.
//

import Foundation
import Moya

final class ProductRepository {
    
    private var provider: MoyaProvider<ProductTargetType>
    
    init(provider: MoyaProvider<ProductTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    func getCategories() async -> Result<[CategoryResponse], Error> {
        do {
            let response = try await provider.requestAsync(.getCategories, model: [CategoryResponse].self)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    // TODO: func getProductList() async -> Result<ProductListResponse, Error>
    
    // TODO: func getProductDetail(id: Int) async -> Result<ProductResponse, Error>
    
    // TODO: func getProductListByCategory(category: String) async -> Result<ProductListResponse, Error>
}
