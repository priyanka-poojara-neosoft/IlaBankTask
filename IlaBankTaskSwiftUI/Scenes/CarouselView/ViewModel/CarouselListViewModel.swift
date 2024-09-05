//
//  CarouselListViewModel.swift
//  IlaBankTaskSwiftUI
//
//  Created by Priyanka on 31/08/24.
//

import SwiftUI

protocol CarouselListDelegate: AnyObject {
    func fetchFinancialServices()
    func fetchServicesList(currentIndex: Int)
    func seachServices(searchText: String, currentIndex: Int)
    func reloadServices()
}

struct CarouselListViewState {
    var mealTypesDetailData: FinancialServicesContainer?
    var financialServices: [FinancialService]?
    var serviceDetailList: [ServiceDetail]?
    var currentServiceTitle: String = ""
    var showBottomSheet = false
    var currentIndex: Int = 0
    var searchText: String = ""
}

class CarouselListViewModel: CarouselListDelegate, ObservableObject {
    
    @Published var viewState = CarouselListViewState()
    
    func fetchFinancialServices() {
        do {
            let response: FinancialServicesContainer = try JSONFileLoader().load(from: "FinanceService", withExtension: .json)
            
            print(response)
            
            viewState.financialServices = response.financialServices
            
        } catch let error {
            
            print(error.localizedDescription)
        }
    }
    
    func fetchServicesList(currentIndex: Int) {
        viewState.currentServiceTitle = viewState.financialServices?[currentIndex].typeTitle ?? ""
        viewState.serviceDetailList = viewState.financialServices?[currentIndex].listData
    }
    
    func seachServices(searchText: String, currentIndex: Int) {
        guard let financialServices = viewState.financialServices else {
            viewState.serviceDetailList = nil
            return
        }
        
        // Get the list of service details for the current index
        if let listData = financialServices[currentIndex].listData {
            // Filter the list based on the search text
            viewState.serviceDetailList = searchText.isEmpty ? listData : listData.filter { service in
                service.title?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        } else {
            viewState.serviceDetailList = nil
        }
        
    }
    
    func reloadServices() {
        viewState.searchText = ""
        fetchFinancialServices()
        fetchServicesList(currentIndex: viewState.currentIndex)
        seachServices(searchText: viewState.searchText, currentIndex: viewState.currentIndex)
    }
}

