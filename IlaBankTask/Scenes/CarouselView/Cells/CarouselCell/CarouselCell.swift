//
//  CarouselCell.swift
//  IlaBankTask
//
//  Created by Neosoft on 29/08/24.
//

import UIKit

class CarouselCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var carouseImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carouseImage.layer.cornerRadius = 20
    }
    
    func setListData(data: FinancialService) {
        if let image = data.typeImage,
            let imageUrl = URL(string: image) {
            self.carouseImage.loadImage(from: imageUrl)
        }
    }
    
}
