//
//  ContentResizingTableView.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/11/22.
//

import Foundation

/// Table view, which dynamically changes it's intrinsic height based on it's content. Useful in some scenarios, for instance, 2-3 items shown inside bottom sheet.
public class ContentResizingTableView : UITableView {
    public override var contentSize : CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
