//
//  CarouselListCell.swift
//  IlaBankTask
//
//  Created by Neosoft on 30/08/24.
//

import UIKit

class CarouselListCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var ivListItem: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    private func configCell() {
        self.layer.cornerRadius = 25
        self.layer.backgroundColor = UIColor.green.withAlphaComponent(0.2).cgColor
    }
    
    func setCarouselListData(data: ServiceDetail) {
        if let url = URL(string: data.image ?? "") {
            self.ivListItem.loadImage(from: url)
        }
        self.lblTitle.text = data.title
        self.lblDescription.text = data.subtitle
    }
    
}
