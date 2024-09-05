//
//  BottomSheetViewController.swift
//  IlaBankTask
//
//  Created by Neosoft on 03/09/24.
//

import UIKit

protocol BottomSheetDelegate {
    func calculateCharacterFrequency(from services: [ServiceDetail]) -> [(key: Character, value: Int)]
}

class BottomSheetViewController: UIViewController {
    
    @IBOutlet weak var lblStatisticsData: UILabel!
    var financialServices: [ServiceDetail] = []
    var displayText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let characterCount = calculateCharacterFrequency(from: financialServices)
        for (char, count) in characterCount.prefix(3) {
            displayText += "\n\(char) = \(count) "
        }
        
        lblStatisticsData.text = """
            Statistics
            Total Items: \(financialServices.count)
            Top 3 Characters:
            \(displayText)
        """
    }
    
}

extension BottomSheetViewController: BottomSheetDelegate {
    internal func calculateCharacterFrequency(from services: [ServiceDetail]) -> [(key: Character, value: Int)] {
        var frequencyDict = [Character: Int]()
        
        // Aggregate all titles listData titles
        let allText = services.flatMap { service in
            // Extract titles from each service
            let titles = [service.title]
            return  titles.compactMap { $0 }
            
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
        return frequencyDict.sorted(by: { $0.value > $1.value }).prefix(3).map { ($0.key, $0.value) }
    }
}
