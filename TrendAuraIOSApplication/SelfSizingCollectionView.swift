//
//  SelfSizingCollectionView.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 07/08/26.
//

import Foundation

// SelfSizingCollectionView.swift
import UIKit

class SelfSizingCollectionView: UICollectionView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        
        print(contentSize.height)
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
        
       
    }

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            invalidateIntrinsicContentSize()
        }
    
}

