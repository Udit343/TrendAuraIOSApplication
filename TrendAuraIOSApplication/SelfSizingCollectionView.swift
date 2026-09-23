//  SelfSizingCollectionView.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 07/08/26.

import Foundation

import UIKit

class SelfSizingCollectionView: UICollectionView {
    override var contentSize: CGSize {
        didSet {
            if contentSize.height != oldValue.height {
                invalidateIntrinsicContentSize()
            }
        }
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric,
               height: collectionViewLayout.collectionViewContentSize.height)
    }
}
