//
//  BottomSheetView.swift
//  IlaBankTaskSwiftUI
//
//  Created by Priyanka on 01/09/24.
//

import SwiftUI

struct BottomSheetView: View {
    let financialServices: [ServiceDetail]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Statistics")
                .font(.headline)
            
            Text("Total Items: \(financialServices.count)")
            
            let characterCount = calculateCharacterFrequency(from: financialServices)
            
            Text("Top 3 Characters:")
            ForEach(characterCount.prefix(3), id: \.key) { char, count in
                Text("\(char) = \(count)")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
    private func calculateCharacterFrequency(from services: [ServiceDetail]) -> [(key: String, value: Int)] {
        var frequencyDict = [String: Int]()
        
        // Aggregate all titles from typeTitle and listData titles
        let allText = services.flatMap { service in
            // Extract titles from each service
            let titles = [service.title]
            return  titles.compactMap { $0 }
        }
        
        // Count character occurrences
        for text in allText {
            for char in text.lowercased() {
                if char.isLetter {
                    let charString = String(char)
                    frequencyDict[charString, default: 0] += 1
                }
            }
        }
        
        // Sort by frequency and return top 3
        return frequencyDict.sorted(by: { $0.value > $1.value }).prefix(3).map { ($0.key, $0.value) }
    }
}
