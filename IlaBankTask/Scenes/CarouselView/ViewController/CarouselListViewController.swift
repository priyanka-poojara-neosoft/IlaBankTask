//
//  CarouselListViewController.swift
//  IlaBankTask
//
//  Created by Neosoft on 29/08/24.
//

import UIKit

class CarouselListViewController: UIViewController {
    
    @IBOutlet weak var btnFloating: UIButton!
        
    @IBOutlet weak var clvCarouselList: UICollectionView!
    
    var viewModel: CarouselViewModel? = CarouselViewModel()
    var isSupplementaryViewLoaded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollection()
        viewModel?.fetchFinancialServices()
        viewModel?.reloadServices(currentIndex: 0)
        title = viewModel?.viewState.currentServiceTitle
    }
    
    private func registerCollection() {
        clvCarouselList.delegate = self
        clvCarouselList.dataSource = self
        clvCarouselList.collectionViewLayout = createGroupLayout()
        
        clvCarouselList.registerHeaderCell(SearchView.self)
        clvCarouselList.registerFooterCell(PageControlView.self)
        
        clvCarouselList.registerReusableCell(CarouselCell.self)
        clvCarouselList.registerReusableCell(CarouselListCell.self)
    }
    
    @IBAction func actionFloatingButton(_ sender: Any) {
        let vc = BottomSheetViewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .pageSheet
        if let services = viewModel?.viewState.serviceDetailList {
            vc.financialServices = services
        }
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        self.navigationController?.present(vc, animated: true)
    }
}
