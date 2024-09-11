//
//  BottomSheetViewController.swift
//  IlaBankTask
//
//  Created by Neosoft on 03/09/24.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    @IBOutlet weak var lblStatisticsData: UILabel!
    
    var viewModel: BottomSheetDelegate
    
    init(viewModel: BottomSheetDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblStatisticsData.text = viewModel.getDisplayText()
    }
    
}
