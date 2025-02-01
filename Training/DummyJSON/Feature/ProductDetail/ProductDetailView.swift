//
//  ProductDetailView.swift
//  DummyJSON
//
//  Created by Irham Naufal on 02/02/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    if let images = viewModel.product?.images {
                        TabView {
                            ForEach(images, id: \.self) { url in
                                AsyncImage(url: URL(string: url)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                    
                                } placeholder: {
                                    Color.gray
                                }
                                
                            }
                        }
                        .tabViewStyle(.page)
                        .frame(height: 300)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("\(viewModel.product?.brand ?? "") - \(viewModel.product?.sku ?? "")")
                            .font(.caption)
                        
                        Text(viewModel.product?.title ?? "")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(viewModel.product?.description ?? "")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            VStack(alignment: .leading) {
                Text("$ \(String(format: "%.2f", viewModel.product?.price ?? 0))")
                    .font(.title2)
                
                Button {
                    
                } label: {
                    Text("Add to Cart")
                        .font(.headline)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.black)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle(viewModel.product?.title ?? "")
        .onAppear {
            viewModel.getProduct()
        }
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(id: 1))
}
