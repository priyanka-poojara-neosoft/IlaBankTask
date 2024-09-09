//
//  CarouselList+DataSource.swift
//  IlaBankTask
//
//  Created by Neosoft on 29/08/24.
//

import UIKit

extension CarouselListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 2 // 1.Carousel, 2.Search & List
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.viewState.financialServices?.count ?? 0
        } else if section == 1 {
            return viewModel.viewState.serviceDetailList?.count ?? 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0: 
            return configureCarouselCell(for: collectionView, indexPath: indexPath)
        case 1:
            return configureListOrEmptyCell(for: collectionView, indexPath: indexPath)
        default: return UICollectionViewCell()
        }
        
    }
    
    // Separate method for configuring carousel cells
    private func configureCarouselCell(for collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return configureCell(for: collectionView, indexPath: indexPath, cellType: CarouselCell.self) { cell in
            if let data = viewModel.viewState.financialServices?[indexPath.row] {
                cell.setListData(data: data)
            }
        }
    }

    // Separate method for configuring list or empty state cells
    private func configureListOrEmptyCell(for collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if let filteredData = viewModel.viewState.filteredServiceDetailList, !filteredData.isEmpty {
            return configureCell(for: collectionView, indexPath: indexPath, cellType: CarouselListCell.self) { cell in
                if let data = viewModel.viewState.serviceDetailList?[indexPath.row] {
                    cell.setCarouselListData(data: data)
                }
            }
        } else {
            return configureCell(for: collectionView, indexPath: indexPath, cellType: EmptyViewCell.self) { _ in
                // Empty cell setup if needed
            }
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
            
            let currentIndex = viewModel.viewState.currentIndex
            if let pagesCount = viewModel.viewState.financialServices?.count {
                footerView.pageControlViewDidUpdatePage(to:  currentIndex, totalPageCount: pagesCount)
            }
            return footerView
        } else {
            return UICollectionReusableView()
        }
    }
    
}
