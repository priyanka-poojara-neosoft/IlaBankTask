//
//  StringConstant.swift
//  IlaBankTask
//
//  Created by Neosoft on 11/09/24.
//

import Foundation

struct StringConstant {
    static let statistics = "Statistics"
    static let totalItemsTitle = "Total Items: "
    static let topThreeCharactersTitle = "Top 3 Characters:"
    
    static func bottomSheetDisplayText(count: Int, displayText: String) -> String {
        return """
        \(statistics)
        \(totalItemsTitle)\(count)
        \(topThreeCharactersTitle)
        \(displayText)
        """
    }
}
