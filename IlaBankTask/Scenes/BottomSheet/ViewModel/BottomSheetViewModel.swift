//
//  BottomSheetViewModel.swift
//  IlaBankTask
//
//  Created by Neosoft on 11/09/24.
//

import Foundation

protocol BottomSheetDelegate: AnyObject {
    func calculateCharacterFrequency(from services: [ServiceDetail]) -> [(key: Character, value: Int)]
    func getDisplayText() -> String
}

class BottomSheetViewModel: BottomSheetDelegate {

    var financialServices: [ServiceDetail]
    
    init(financialServices: [ServiceDetail]) {
        self.financialServices = financialServices
    }
    
    func calculateCharacterFrequency(from services: [ServiceDetail]) -> [(key: Character, value: Int)] {
        var frequencyDict = [Character: Int]()
        
        let allText = services.compactMap { service in
            return service.title
        }
        
        // Count character occurrences
        for text in allText {
            for char in text.lowercased() {
                if char.isLetter {
                    frequencyDict[char, default: 0] += 1
                }
            }
        }
        
        // Sort by frequency and return top 3
        return frequencyDict.sorted { $0.value > $1.value }
    }
    
    func getDisplayText() -> String {
        let characterCount = calculateCharacterFrequency(from: financialServices)
        var displayText = ""
        
        for (char, count) in characterCount.prefix(3) {
            displayText += "\n\(char) = \(count)"
        }
        
        return StringConstant.bottomSheetDisplayText(count: financialServices.count, displayText: displayText)

    }
}
