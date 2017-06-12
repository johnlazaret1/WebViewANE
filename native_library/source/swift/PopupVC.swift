// Copyright 2017 Tua Rua Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  Additional Terms
//  No part, or derivative of this Air Native Extensions's code is permitted
//  to be sold as the basis of a commercially packaged Air Native Extension which
//  undertakes the same purpose as this software. That is, a WebView for Windows,
//  OSX and/or iOS and/or Android.
//  All Rights Reserved. Tua Rua Ltd.
import Cocoa
import Foundation
import WebKit

class PopupVC: NSViewController, WKUIDelegate, WKNavigationDelegate {
    private var webView: WKWebView?
    private var configuration: WKWebViewConfiguration = WKWebViewConfiguration()
    private var _request: URLRequest!
    private var _width: Int!
    private var _height: Int!

    convenience init(request: URLRequest, width: Int, height: Int) {
        self.init()
        self._request = request
        self._width = width
        self._height = height

        webView = WKWebView(frame: self.view.frame, configuration: configuration)
        if let wv = webView {
            wv.translatesAutoresizingMaskIntoConstraints = true
            wv.navigationDelegate = self
            wv.uiDelegate = self
            wv.load(_request)
            self.view.addSubview(wv)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    override func loadView() {
        let myRect: NSRect = NSRect.init(x: 0, y: 0, width: _width, height: _height)
        self.view = NSView.init(frame: myRect)
    }

}