//
//  MainPage.swift
//  Delta_tour_kz
//
//  Created by Yerasyl on 24.10.2024.
//

import SwiftUI
import WebKit

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    helpButton
                    Spacer()
                    instaButton
                   
                }
                infoAboutUs
            }
            .padding()
        }
    }
    
    var helpButton: some View {
        Button {
            openWhatsapp()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.accent, lineWidth: 2)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 36)
                
                HStack {
                    Image(systemName: "ellipsis.message")
                        .font(.system(size: 20))
                    Text("Нужна помощь?")
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    var instaButton: some View {
        Button {
            openInstagram()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.accent, lineWidth: 2)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 36)
                
                HStack {
                    Image("insta")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Наш Instagram")
                        .foregroundColor(.accent)
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    var infoAboutUs: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Заголовок "Кто мы?"
            Text("Кто мы?")
                .foregroundColor(.accent)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            
            // Встроенное видео из YouTube
            YouTubeVideoView(videoID: "Mv3oM0Plamw")
                .frame(height: 200)
                .padding()
            
            // Текст параграфа
            Text("\tПредставляем второй документальный фильм из серии nFactorial Originals – «Задача D. Как спортивное программирование меняет мир?». Это история о том, как финал международной олимпиады по спортивному программированию ICPC 2024 собрал лучших программистов со всего мира в Астане и открыл новые возможности для развития этой сферы в Казахстане. \n\n\tФильм покажет, что ICPC — это не просто соревнование. Это место, где формируются будущие технологические лидеры. Вы узнаете личные истории участников, тренеров и организаторов. Как они готовились к финалу? И как участие в ICPC стало отправной точкой для их профессионального роста и создания собственных проектов? \n\n\tМы расскажем, как ICPC меняет жизни участников, помогая им строить успешные карьеры и создавать инновации, которые влияют на будущее. Каждая история — это вдохновение для тех, кто мечтает изменить мир через программирование.\n\nПриятного просмотра!")
                .padding()
                .foregroundColor(.accent)
                .background(RoundedRectangle(cornerRadius: 16).fill(Color.leda2))
                .font(.body)
            Spacer()
        }
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
        let phoneNumber = "77078841911" // Укажите нужный номер телефона
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
