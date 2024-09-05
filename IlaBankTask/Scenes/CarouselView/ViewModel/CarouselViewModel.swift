//
//  CarouselViewModel.swift
//  IlaBankTask
//
//  Created by Neosoft on 31/08/24.
//

import UIKit

protocol CarouselListDelegate: AnyObject {
    func fetchFinancialServices()
    func fetchServicesList(currentIndex: Int)
    func seachServices(searchText: String)
    func reloadServices(currentIndex: Int)
}

struct CarouselListViewState {
    var mealTypesDetailData: FinancialServicesContainer?
    var financialServices: [FinancialService]?
    var serviceDetailList: [ServiceDetail]?
    var filteredServiceDetailList: [ServiceDetail]?
    var showBottomSheet = false
    var currentIndex: Int = 0
    var currentServiceTitle: String = ""
    var searchText: String = ""
}

class CarouselViewModel: CarouselListDelegate {
    
    var viewState = CarouselListViewState()
    
    func fetchFinancialServices() {
        do {
            let response: FinancialServicesContainer = try JSONFileLoader().load(from: "FinanceService", withExtension: .json)
            
            viewState.financialServices = response.financialServices
            
            print("RESPONSE RECEIVED SUCCESSFULLY")
            
        } catch let error {
            
            print(error.localizedDescription)
        }
    }
    
    func fetchServicesList(currentIndex: Int) {
        viewState.currentServiceTitle = viewState.financialServices?[currentIndex].typeTitle ?? ""
        viewState.serviceDetailList = viewState.financialServices?[currentIndex].listData
        viewState.filteredServiceDetailList = viewState.financialServices?[currentIndex].listData
    }
    
    func seachServices(searchText: String) {
        
        guard let financialServices = viewState.financialServices else {
            viewState.serviceDetailList = nil
            return
        }
        
        // Get the list of service details for the current index
        if let listData = financialServices[viewState.currentIndex].listData {
            // Filter the list based on the search text
            viewState.filteredServiceDetailList = searchText.isEmpty ? listData : listData.filter { service in
                service.title?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        } else {
            viewState.serviceDetailList = nil
        }
        viewState.serviceDetailList = viewState.filteredServiceDetailList
    }
    
    func reloadServices(currentIndex: Int) {
        viewState.searchText = ""
        viewState.currentIndex = currentIndex
        fetchServicesList(currentIndex: viewState.currentIndex)
    }
}
