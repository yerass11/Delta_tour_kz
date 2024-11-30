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
            showAlert(message: "Unable to open Instagram. Please check if the app is installed or if the link is correct.")
        }
    }
    
    func openWhatsapp() {
        let phoneNumber = "77078841911"
        let urlWhats = "https://wa.me/\(phoneNumber)"
        if let url = URL(string: urlWhats), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            showAlert(message: "Unable to open WhatsApp. Please ensure the app is installed.")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
            topController.present(alert, animated: true, completion: nil)
        }
    }
}

#Preview {
    HomeView()
}
