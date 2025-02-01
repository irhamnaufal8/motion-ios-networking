//
//  Untitled.swift
//  DummyJSON
//
//  Created by Irham Naufal on 01/02/25.
//

import SwiftUI

// Add case for view including their dependencies
enum Route {
    case home(AppRouter)
    case productDetail(ProductDetailViewModel)
}

extension Route: View {
    
    var body: some View {
        // Add view class for every case
        switch self {
        case .home(let router):
            HomeView(router: router)
        case .productDetail(let viewModel):
            ProductDetailView(viewModel: viewModel)
        }
    }
    
    var id: Int {
        // Add id for every case, id must be unique
        switch self {
        case .home: 1
        case .productDetail: 2
        }
    }
}

final class AppRouter: ObservableObject {
    
    @Published var routes: [Route] = []
    
    func route(to view: Route) {
        routes.append(view)
    }
    
    func back() {
        _ = routes.popLast()
    }
    
    func backToRoot() {
        routes = []
    }
}

extension Route: Hashable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}
