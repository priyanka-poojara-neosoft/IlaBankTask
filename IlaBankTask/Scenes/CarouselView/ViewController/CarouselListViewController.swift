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
    
    var viewModel: CarouselListDelegate
    var isSupplementaryViewLoaded = false
    
    init(viewModel: CarouselListDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollection()
        viewModel.fetchFinancialServices()
        viewModel.reloadServices(currentIndex: 0)
        title = viewModel.viewState.currentServiceTitle
        view.addTapGesture {
            self.view.endEditing(true)
        }
    }
    
    private func registerCollection() {
        clvCarouselList.delegate = self
        clvCarouselList.dataSource = self
        clvCarouselList.collectionViewLayout = createGroupLayout()
        
        clvCarouselList.register(SearchView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellIdentifiers.search)
        clvCarouselList.register(PageControlView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CellIdentifiers.pageControl)
        
        clvCarouselList.register(UINib(nibName: CellIdentifiers.carousel, bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.carousel)
        clvCarouselList.register(UINib(nibName: CellIdentifiers.carouselList, bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.carouselList)
        clvCarouselList.register(UINib(nibName: CellIdentifiers.emptyView, bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.emptyView)
        
    }
    
    @IBAction func actionFloatingButton(_ sender: Any) {
        guard let services = viewModel.viewState.serviceDetailList else { return }
       
        let bottomSheetVC = createBottomSheetViewController(with: services)
        configureSheetPresentation(for: bottomSheetVC)
        self.navigationController?.present(bottomSheetVC, animated: true)
    }
    
    private func createBottomSheetViewController(with services: [ServiceDetail]) -> BottomSheetViewController {
        let bottomSheetViewModel = BottomSheetViewModel(financialServices: services)
        let bottomSheetVC = BottomSheetViewController(viewModel: bottomSheetViewModel)
        bottomSheetVC.modalTransitionStyle = .coverVertical
        bottomSheetVC.modalPresentationStyle = .pageSheet
        return bottomSheetVC
    }

    private func configureSheetPresentation(for viewController: BottomSheetViewController) {
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
    }
}
