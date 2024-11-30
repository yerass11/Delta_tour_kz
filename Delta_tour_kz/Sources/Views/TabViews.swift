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
                        FeedbackView()
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
            .toolbarBackground(Color.gray, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Delta Tour KZ")
                        .foregroundColor(.accent) // Задаем цвет текста
                        .font(.headline) // Настраиваем шрифт
                }
            }
        }
    }
}

#Preview {
    TabViews()
}
