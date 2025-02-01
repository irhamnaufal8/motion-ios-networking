//
//  Untitled.swift
//  DummyJSON
//
//  Created by Irham Naufal on 01/02/25.
//

import SwiftUI

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

enum Route {
    case home(AppRouter)
    case productDetail(ProductDetailViewModel)
}

extension Route: View {
    var body: some View {
        switch self {
        case .home(let router):
            HomeView(router: router)
        case .productDetail(let viewModel):
            ProductDetailView(viewModel: viewModel)
        }
    }
    
    var id: Int {
        switch self {
        case .home: 1
        case .productDetail: 2
        }
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
