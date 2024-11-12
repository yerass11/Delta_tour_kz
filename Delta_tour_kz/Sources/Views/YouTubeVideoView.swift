//
//  YouTubeVideoView.swift
//  Delta_tour_kz
//
//  Created by Yerasyl on 04.11.2024.
//
import SwiftUI
import WebKit

struct YouTubeVideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.load(URLRequest(url: url))
    }
}
