//
//  CarouselList+DataSource.swift
//  IlaBankTask
//
//  Created by Neosoft on 29/08/24.
//

import UIKit

extension CarouselListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel?.viewState.financialServices?.count ?? 0
        } else if section == 1 {
            return viewModel?.viewState.serviceDetailList?.count ?? 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return configureCell(for: collectionView, indexPath: indexPath, cellType: CarouselCell.self) { cell in
                if let data = viewModel?.viewState.financialServices?[indexPath.row] {
                    cell.setListData(data: data)
                }
            }
        } else if  indexPath.section == 1 {
            return configureCell(for: collectionView, indexPath: indexPath, cellType: CarouselListCell.self) { cell in
                if let data = viewModel?.viewState.serviceDetailList?[indexPath.row] {
                    cell.setCarouselListData(data: data)
                }
            }
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // If the supplementary views have already been loaded, return an empty view to prevent reloading
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(indexPath: indexPath, kind: kind) as SearchView
            print("Displaying header at \(indexPath.row)  \(indexPath.section)")
            headerView.delegate = self
            headerView.searchBar.text = ""
            return headerView
        } else if (kind == UICollectionView.elementKindSectionFooter) {
            let footerView = collectionView.dequeueReusableSupplementaryView(indexPath: indexPath, kind: kind) as PageControlView
            if let currentIndex = viewModel?.viewState.currentIndex,
               let pagesCount = viewModel?.viewState.financialServices?.count {
                footerView.pageControlViewDidUpdatePage(to:  currentIndex, totalPageCount: pagesCount)
            }
            return footerView
        } else {
            return UICollectionReusableView()
        }
    }
    
}
