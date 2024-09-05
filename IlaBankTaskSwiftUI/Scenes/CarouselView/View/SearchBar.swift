//
//  SearchBar.swift
//  IlaBankTaskSwiftUI
//
//  Created by Priyanka on 01/09/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @FocusState private var isSearchBarFocused: Bool
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(7)
                .focused($isSearchBarFocused) // External focus management
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .autocorrectionDisabled(true)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onChange(of: searchText) { oldValue, newValue in
                    DispatchQueue.main.async {
                        isSearchBarFocused = searchText.isEmpty ? false : true
                    }
                }
        }
    }
}
