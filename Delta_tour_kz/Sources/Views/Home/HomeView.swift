import SwiftUI
import WebKit

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    CustomButton(
                        title: "Нужна помощь?",
                        action: {
                            openWhatsapp()
                        },
                        icon: .systemName("ellipsis.message")
                    )
                    Spacer()
                    CustomButton(
                        title: "Наш Instagram",
                        action: {
                            openInstagram()
                        },
                        icon: .customImageName("insta")
                    )
                }
                .padding(.horizontal)
                
                AboutUsSectionView()
            }
            .padding()
        }
        .padding(.vertical)
    }
    
    func openInstagram() {
        let instaURL = "https://www.instagram.com/kuanyshkaliyeva_k"
        if let url = URL(string: instaURL), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("Не удалось открыть Instagram.")
        }
    }
    
    func openWhatsapp() {
        let phoneNumber = "77078841911"
        let urlWhats = "https://wa.me/\(phoneNumber)"
        if let url = URL(string: urlWhats), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("Не удалось открыть WhatsApp.")
        }
    }
}

#Preview {
    HomeView()
}
