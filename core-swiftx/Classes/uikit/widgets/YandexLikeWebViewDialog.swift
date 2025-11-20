//
//  YandexLikeWebViewDialog.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/21/22.
//

import Foundation

public class YandexLikeWebViewDialog : YandexLikeBottomSheetDialog {
    
    private let url : String?
    private let html : String?
    private let headers : [String : Any]
    private let dialogTitle : String?
    private let allowRedirects: Bool
    
    private let titleView = BottomSheetTitleView()
    
    public init(
        url: String? = nil,
        html: String? = nil,
        title: String? = nil,
        headers: [String: Any] = [:],
        allowRedirects: Bool = false
    ) {
        self.url = url
        self.html = html
        self.dialogTitle = title
        self.headers = headers
        self.allowRedirects = allowRedirects
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        isCancellable = false
    }
    
}
