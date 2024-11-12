//
//  FeedbackPage.swift
//  Delta_tour_kz
//
//  Created by Yerasyl on 24.10.2024.
//

import SwiftUI

struct FeedbackPage: View {
    @State private var showSheet = false
    let imageNames = (1...28).map { "result\($0)" }
    
    var body: some View {
        ScrollView {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.leda)
                VStack(spacing: 10) {
                    Text("Почему выбирают нас?")
                        .foregroundColor(.accent)
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                    
                    Text("  С гордостью представляем вам результаты нашей работы! Мы помогли тысячам путешественников осуществить мечту и открыть для себя новые горизонты. Присоединяйтесь к нам, и мир откроется перед вами!")
                    Text("• Более 250 успешно полученных виз с марта 2024")
                    Text("• Полное сопровождение и тщательная проверка документов")
                    Text("• Мы всегда отчитываемся и держим связь с клиентами!")
                    Text("• Мы всегда доводим каждого до результата!")
                    Text("Пусть ваше путешествие начнется с нами!")
                }
                .padding()
                .foregroundColor(.accent)
                .font(.system(size: 18))
            }
            
            
            PhotoCaruselView(images: imageNames)
            
            feedbackList
            feedbackList
            feedbackList
            feedbackList
            feedbackList
            feedbackList
            feedbackList
            feedbackList
        }
        .padding()
    }
    
    
    var feedbackList: some View {
        HStack {
            Text("Я Арман Арманов, спасибо большое организации Delta Tour kz за такие возможности...")
                .foregroundColor(.accent)
            Image("visa")
                .resizable()
                .frame(width: 90, height: 70)
        }.padding()
    }
}

struct InfoSheetView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    FeedbackPage()
}
