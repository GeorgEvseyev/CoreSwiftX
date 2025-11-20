//
//  BottomSheetTitleView.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/11/22.
//

import Foundation
import TinyConstraints

public class BottomSheetTitleView : UIView {
    
    private let arrow = BottomSheetArrow()
    public let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 19)
        return lbl
    }()
    private lazy var padding = Padding(contentView: titleLabel, padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    private let divider = UIView()
    
    public init() {
        super.init(frame: .zero)
        layout()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func layout() {
        addSubview(arrow)
        addSubview(padding)
        addSubview(divider)
        padding.backgroundColor = UIColorCompat.systemGray6
        divider.backgroundColor = .lightGray
        arrow.top(to: self)
        arrow.centerX(to: self)
        padding.topToBottom(of: arrow, offset: 8)
        padding.edges(to: self, excluding: [.top, .bottom])
        divider.topToBottom(of: padding)
        divider.edges(to: self, excluding: [.top, .bottom])
        divider.height(0.4)
        divider.bottom(to: self)
    }
    
}
