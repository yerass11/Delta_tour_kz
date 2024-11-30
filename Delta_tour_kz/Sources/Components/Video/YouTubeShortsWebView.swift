import SwiftUI
import WebKit

struct YouTubeShortsWebView: UIViewRepresentable {
    let shortsURL: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        // Загрузка полной ссылки YouTube Shorts
        if let url = URL(string: shortsURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
