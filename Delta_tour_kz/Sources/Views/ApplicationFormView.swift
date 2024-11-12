//
//  RequestsPage.swift
//  Delta_tour_kz
//
//  Created by Yerasyl on 24.10.2024.
//

import SwiftUI

struct ApplicationFormView: View {
    @State private var fullName = ""
    @State private var phoneNumber = ""
    
    var body: some View {
        ScrollView {
            Text("Ближайшие туры")
                .foregroundColor(.accent)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            
            PhotoCaruselView(images: ["usa", "europe", "japan", "uk", "europe", "japan"])
            
            Divider()
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.gray.opacity(0.15))
                
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Оставьте заявку")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.accent)
                    
                    TextField("", text: $fullName, prompt: Text("ФИО").foregroundColor(.accent.opacity(0.7)))
                        .font(Font.system(size: 14))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.leda2))
                    
                        .foregroundColor(.accent)
                        .offset(x:8, y: 10)
                    
                    TextField("", text: $phoneNumber, prompt: Text("Номер телефона").foregroundColor(.accent.opacity(0.7)))
                        .font(Font.system(size: 14))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.leda2))
                    
                    
                        .foregroundColor(.accent)
                        .offset(x:8, y: 10)
                    
                    
                    Button(action: sendToWhatsApp) {
                        Text("Отправить в WhatsApp")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .padding()
    }
    
    func sendToWhatsApp() {
        let defPhoneNumber = "77078841911"
        let message = "Заявка от клиента:\nФИО: \(fullName)\nТелефон: \(phoneNumber)"
        let urlWhats = "https://wa.me/\(defPhoneNumber)?text=\(message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        
        if let urlString = URL(string: urlWhats), UIApplication.shared.canOpenURL(urlString) {
            UIApplication.shared.open(urlString)
        } else {
            print("WhatsApp не установлен.")
        }
    }
}

#Preview {
    ApplicationFormView()
}
