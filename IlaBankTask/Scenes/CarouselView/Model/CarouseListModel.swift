//
//  CarouseListModel.swift
//  IlaBankTask
//
//  Created by Neosoft on 30/08/24.
//

import Foundation

// MARK: - Models
/*
enum FinancialServiceType: String {
    case savingInvestment = "Savings & Investments"
    case loanCredit = "Loans & Credit"
    case insuranceProtection = "Insurance & Protection"
}

struct FinancialServiceData {
    
}

struct FinancialService {
    let typeImage: String
    let typeTitle: FinancialServiceType
    let listData: [ServiceDetail]
}

struct ServiceDetail {
    let image: String
    let title: String
    let subtitle: String
}

// MARK: - Dummy Data Function

enum CarouselListSection {
    case carousel([FinancialService])
    case list([ServiceDetail])
}

extension FinancialService {
    static func dummyData() -> [FinancialService] {
        return [
            FinancialService(
                typeImage: "https://example.com/images/savings_icon.png",
                typeTitle: .savingInvestment,
                listData: [
                    ServiceDetail(
                        image: "https://example.com/images/savings_account.jpg",
                        title: "Savings Account",
                        subtitle: "Secure your future with our high-interest savings accounts that grow your wealth over time."
                    ),
                    ServiceDetail(
                        image: "https://example.com/images/fixed_deposit.jpg",
                        title: "Fixed Deposit",
                        subtitle: "Enjoy guaranteed returns with our flexible fixed deposit plans, tailored to your financial goals."
                    ),
                    ServiceDetail(
                        image: "https://example.com/images/mutual_funds.jpg",
                        title: "Mutual Funds",
                        subtitle: "Diversify your investment portfolio with our expertly managed mutual funds."
                    ),
                    ServiceDetail(
                        image: "https://example.com/images/retirement_plan.jpg",
                        title: "Retirement Plan",
                        subtitle: "Plan your retirement with confidence, choosing from our range of pension schemes and annuities."
                    )
                ]
            ),
            FinancialService(
                typeImage: "https://example.com/images/loans_icon.png",
                typeTitle: .loanCredit,
                listData: [
                    ServiceDetail(
                        image: "https://example.com/images/home_loan.jpg",
                        title: "Home Loan",
                        subtitle: "Fulfill your dream of owning a home with our affordable home loan options."
                    ),
                    ServiceDetail(
                        image: "https://example.com/images/personal_loan.jpg",
                        title: "Personal Loan",
                        subtitle: "Get instant approval on personal loans with minimal documentation and quick disbursal."
                    ),
                    ServiceDetail(
                        image: "https://example.com/images/credit_card.jpg",
                        title: "Credit Card",
                        subtitle: "Choose from our wide range of credit cards that offer exclusive rewards and cashback."
                    ),
                    ServiceDetail(
                        image: "https://example.com/images/auto_loan.jpg",
                        title: "Auto Loan",
                        subtitle: "Drive your dream car home with our low-interest auto loans and easy EMIs."
                    )
                ]
            ),
            FinancialService(
                typeImage: "https://example.com/images/insurance_icon.png",
                typeTitle: .insuranceProtection,
                listData: [
                    ServiceDetail(
                        image: "https://example.com/images/health_insurance.jpg",
                        title: "Health Insurance",
                        subtitle: "Protect your family’s health with our comprehensive health insurance plans."
                    ),
                    ServiceDetail(
                        image: "https://example.com/images/life_insurance.jpg",
                        title: "Life Insurance",
                        subtitle: "Ensure your loved ones' financial security with our tailored life insurance policies."
                    ),
                    ServiceDetail(
                        image: "https://example.com/images/home_insurance.jpg",
                        title: "Home Insurance",
                        subtitle: "Safeguard your home against unforeseen events with our reliable home insurance plans."
                    ),
                    ServiceDetail(
                        image: "https://example.com/images/travel_insurance.jpg",
                        title: "Travel Insurance",
                        subtitle: "Travel worry-free with our comprehensive travel insurance that covers medical and trip-related risks."
                    )
                ]
            )
        ]
    }
}
*/

// MARK: JSON MODEL
 
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
