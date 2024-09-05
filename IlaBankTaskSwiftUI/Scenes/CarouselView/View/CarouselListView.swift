//
//  CarouselListView.swift
//  IlaBankTaskSwiftUI
//
//  Created by Priyanka on 31/08/24.
//

import SwiftUI

struct CarouselListView: View {
    
    @StateObject var viewModel: CarouselListViewModel

    var body: some View {
        ZStack {
           // Carousel List Main View
            CarouselListMainView(viewModel: viewModel)
            // Floating Action Button
            FloatingButton(showBottom: $viewModel.viewState.showBottomSheet)
        }
        .sheet(isPresented: $viewModel.viewState.showBottomSheet) {
            if let financialServices = viewModel.viewState.serviceDetailList {
                BottomSheetView(financialServices: financialServices)
            }
        }
        .navigationTitle(viewModel.viewState.currentServiceTitle)
    }
}

// MARK: Floating Action Button
private struct FloatingButton: View {
    
    @Binding var showBottom: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showBottom.toggle()
                }) {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(90))
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                .padding()
            }
        }
    }
}

// MARK: Carousel List Main View
private struct CarouselListMainView: View {
    
    @StateObject var viewModel: CarouselListViewModel
    
    var body: some View {
        List {
            Section {
                CarouselView(currentIndex: $viewModel.viewState.currentIndex, financialServices: viewModel.viewState.financialServices)
                    .listRowInsets(EdgeInsets())
                    .frame(height: 250)
            }.listRowSeparator(.hidden)
            
            Section {
                if let serviceDetailList = viewModel.viewState.serviceDetailList {
                    ListViewForCurrentIndex(listData: serviceDetailList, currentIndex: viewModel.viewState.currentIndex)
                        .listRowInsets(EdgeInsets())
                } else {
                    Text("No service details available")
                        .padding()
                }
                
            } header: {
                SearchBar(searchText: $viewModel.viewState.searchText)
                    .listRowInsets(EdgeInsets())
                    .onChange(of: viewModel.viewState.searchText) { oldValue, newValue in
                        print("OLD: ", oldValue, "NEW:", newValue)
                        viewModel.seachServices(searchText: newValue, currentIndex: viewModel.viewState.currentIndex)
                    }
            }.listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear() {
            viewModel.reloadServices()
        }
        .onChange(of: viewModel.viewState.currentIndex, { oldValue, newValue in
            viewModel.reloadServices()
        })
    }
}

#Preview {
    CarouselListView(viewModel: CarouselListViewModel())
}
