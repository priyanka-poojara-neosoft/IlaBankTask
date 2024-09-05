//
//  SearchView.swift
//  IlaBankTask
//
//  Created by Neosoft on 30/08/24.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
    func didUpdateSearchText(_ searchText: String, _ searchBar: UISearchBar)
}

class SearchView: UICollectionReusableView, Reusable {
    
    weak var delegate: SearchViewDelegate?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.text = ""
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.showsCancelButton = true
        searchBar.setShowsCancelButton(false, animated: true)
        
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set Delegate
        searchBar.delegate = self
        
        addSubview(stackView)
        stackView.addArrangedSubview(searchBar)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

extension SearchView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.didUpdateSearchText(searchText, searchBar)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        delegate?.didUpdateSearchText("", searchBar)
    }
    
}
