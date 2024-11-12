//
//  PhotoCaruselView.swift
//  Delta_tour_kz
//
//  Created by Yerasyl on 12.11.2024.
//

import SwiftUI

struct PhotoCaruselView: View {
    let images: [String]
    @State private var selectedImage = 0
    
    var body: some View {
            TabView(selection: $selectedImage) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(height: 30)
                        .tag(index)
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        
            .padding(.bottom)
    }
}
