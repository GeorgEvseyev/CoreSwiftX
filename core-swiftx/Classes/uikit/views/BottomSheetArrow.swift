//
//  BottomSheetArrow.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/11/22.
//

import Foundation

public class BottomSheetArrow : UIView {
    
    public init() {
        super.init(frame: .zero)
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 3
        self.size(CGSize(width: 44, height: 6))
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
