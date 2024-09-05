//
//  FinanceServiceModel.swift
//  IlaBankTaskSwiftUI
//
//  Created by Priyanka on 31/08/24.
//

import Foundation

struct FinancialServicesContainer: Decodable {
    let financialServices: [FinancialService]
    
    enum CodingKeys: String, CodingKey {
        case financialServices = "financial_services"
    }
}

struct FinancialService: Decodable, Identifiable {
    let id = UUID()
    let typeImage: String?
    let typeTitle: String?
    let listData: [ServiceDetail]?
    
    enum CodingKeys: String, CodingKey {
        case typeImage = "type_image"
        case typeTitle = "type_title"
        case listData = "listData"
    }
}

struct ServiceDetail: Decodable, Hashable {
    let image: String?
    let title: String?
    let subtitle: String?
}
