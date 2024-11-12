//
//  TavViews.swift
//  Delta_tour_kz
//
//  Created by Yerasyl on 24.10.2024.
//

import SwiftUI

struct TabViews: View {
    @State var selectedTab = 1
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    ZStack {
                        Image("BG")
                            .resizable()
                            .ignoresSafeArea()
                        HomeView()
                    }
                    .tabItem {
                        Label("Главная", systemImage: "house.fill")
                    }
                    .accentColor(selectedTab == 1 ? .accent : .red)
                    .tag(1)
                    
                    ZStack {
                        Image("BG")
                            .resizable()
                            .ignoresSafeArea()
                        ServicesView()
                    }
                    .tabItem {
                        Label("Услуги", systemImage: "duffle.bag.fill")
                    }
                    .accentColor(selectedTab == 2 ? .accent : .red)
                    .tag(2)
                    
                    ZStack {
                        Image("BG")
                            .resizable()
                            .ignoresSafeArea()
                        FeedbackPage()
                    }
                    .tabItem {
                        Label("Отзывы", systemImage: "ellipsis.message.fill")
                    }
                    .accentColor(selectedTab == 3 ? .accent : .red)
                    .tag(3)
                    
                    ZStack {
                        Image("BG")
                            .resizable()
                            .ignoresSafeArea()
                        ApplicationFormView()
                    }
                    .tabItem {
                        Label("Запросы", systemImage: "person.fill.badge.plus")
                    }
                    .accentColor(selectedTab == 4 ? .accent : .red)
                    .tag(4)
                }
                .accentColor(.accent)
            }
            .navigationTitle("Delta Tour KZ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.gray)
            .toolbarColorScheme(.dark)
        }
    }
}

#Preview {
    TabViews()
}
