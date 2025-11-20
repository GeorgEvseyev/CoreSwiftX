//
//  YandexLikeWebViewDialog.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/21/22.
//

import Foundation
import WebKit

public class CoreSwiftXWebViewController : UIViewController, WKNavigationDelegate {
    
    public struct SafeAreaParameters {
        public let top : Bool
        public let left : Bool
        public let right : Bool
        public let bottom : Bool
        
        public init(top : Bool, left : Bool, bottom : Bool, right : Bool) {
            self.top = top
            self.left = left
            self.bottom = bottom
            self.right = right
        }
        
        public static let enabled : SafeAreaParameters = .init(top: true, left: true, bottom: true, right: true)
        public static let disabled : SafeAreaParameters = .init(top: false, left: false, bottom: false, right: false)
    }
    
    private let url : String?
    private let html : String?
    private let headers : [String : Any]
    private let useSafeArea : SafeAreaParameters
    private let dialogTitle : String?
    private let allowRedirects: Bool
    private let allowBackwardNavigationGestures: Bool
    public var urlChangeListener : ((String) -> Void)?
    private var urlObservation : NSKeyValueObservation?
    
    private let wv : WKWebView = {
        let conf = WKWebViewConfiguration()
        let jScript = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
        conf.ignoresViewportScaleLimits = true
        let contr = WKUserContentController()
        contr.addUserScript(WKUserScript.init(source: jScript, injectionTime: .atDocumentEnd, forMainFrameOnly: true))
        conf.userContentController = contr
        return ZeroInsetsWebView(frame: .zero, configuration: conf)
    }()
    
    public init(
        url: String? = nil,
        html: String? = nil,
        title: String? = nil,
        headers: [String: Any] = [:],
        allowRedirects: Bool = false,
        allowBackwardNavigationGestures: Bool = true,
        safeAreaParameters : SafeAreaParameters = .enabled
    ) {
        self.url = url
        self.html = html
        self.dialogTitle = title
        self.headers = headers
        self.allowRedirects = allowRedirects
        self.useSafeArea = safeAreaParameters
        self.allowBackwardNavigationGestures = allowBackwardNavigationGestures
        super.init(nibName: nil, bundle: nil)
        self.title = dialogTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(wv)
        wv.allowsBackForwardNavigationGestures = allowBackwardNavigationGestures
        wv.allowsLinkPreview = false
        wv.top(to: useSafeArea.top ? view.safeAreaCompat : view)
        wv.left(to: useSafeArea.left ? view.safeAreaCompat : view)
        wv.bottom(to: useSafeArea.bottom ? view.safeAreaCompat : view)
        wv.right(to: useSafeArea.right ? view.safeAreaCompat : view)
        if let r = url {
            var request = URLRequest(url: r.toURL())
            headers.forEach { key, value in
                request.setValue("\(value)", forHTTPHeaderField: key)
            }
            wv.load(request)
        }
        else if let h = html {
            wv.loadHTMLString(h, baseURL: nil)
        }
        urlObservation = wv.observe(\.url, changeHandler: { [weak self] (webView, change) in
            let url = (webView.backForwardList.currentItem?.url.absoluteString).orEmpty()
            self?.urlChangeListener?(url)
        })
    }
    
}

fileprivate class ZeroInsetsWebView : WKWebView {
    
    override open var safeAreaInsets: UIEdgeInsets {
        .zero
    }
}
