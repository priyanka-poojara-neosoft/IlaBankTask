//
//  UICollectionView+Extension.swift
//  IlaBankTask
//
//  Created by Neosoft on 29/08/24.
//

import UIKit

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
}

extension Reusable {
    static var reuseIdentifier: String { return String(describing: self) }
    static var nib: UINib? {
        UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UICollectionView {
    
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }

    func registerHeaderCell<T: UICollectionReusableView>(_: T.Type) where T: Reusable {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerFooterCell<T: UICollectionReusableView>(_: T.Type) where T: Reusable {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(indexPath: IndexPath, kind: String) -> T where T: Reusable {
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    
}

public func configureCell<T: UICollectionViewCell>(
    for collectionView: UICollectionView,
    indexPath: IndexPath,
    cellType: T.Type,
    configure: (T) -> Void
) -> T {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as! T
    configure(cell)
    return cell
}
