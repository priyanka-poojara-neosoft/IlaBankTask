//
//  CarouselView.swift
//  IlaBankTaskSwiftUI
//
//  Created by Priyanka on 31/08/24.
//

import SwiftUI

struct CarouselView: View {

    @Binding var currentIndex: Int
    let financialServices: [FinancialService]?

    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                
                if let financialServices = financialServices {
                    ForEach(financialServices.indices, id: \.self) { index in
                        
                        let urlString = financialServices[index].typeImage
                        let url = URL(string: urlString ?? "")
                        
                        AsyncImageView(url: url)
                        
                        .tag(index)
                        .padding(.horizontal, 23)
                    }
                } else {
                    // Handle the case where financialServices is nil
                    Text("No data available")
                        .padding(.horizontal, 23)
                }
                
            }.tabViewStyle(.page(indexDisplayMode: .never))
            
            // Custom Page Control
            PageControlView(numberOfPages: financialServices?.count ?? 0, currentIndex: currentIndex)
            
        }
    }
}

// MARK: - PageControlView
private struct PageControlView: View {
    let numberOfPages: Int
    let currentIndex: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 8) {
                ForEach(0..<numberOfPages, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color.blue : Color.gray)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.bottom, 6)
        }
    }
}

// MARK: - AsyncImageView
private struct AsyncImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
        } placeholder: {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .frame(height: 100)
        }
    }
}
