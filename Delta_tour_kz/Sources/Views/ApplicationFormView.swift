import SwiftUI

struct ApplicationFormView: View {
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var showError = false
    @State private var errorMessage = ""
    
    private let defPhoneNumber = "77078841911"
    private let backgroundGray = Color.gray.opacity(0.15)
    private let inputFieldBackground = Color("leda2")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
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
                        .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color("leda2"), Color("leda")]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Оставьте заявку")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.accent)
                        
                        TextField("", text: $fullName, prompt: Text("ФИО").foregroundColor(.accent.opacity(0.7)))
                            .textFieldStyle(FieldStyle(background: inputFieldBackground))
                        
                        TextField("", text: $phoneNumber, prompt: Text("Номер телефона").foregroundColor(.accent.opacity(0.7)))
                            .textFieldStyle(FieldStyle(background: inputFieldBackground))
                        
                        Button(action: validateAndSend) {
                            Text("Отправить в WhatsApp")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .padding(.top)
                        
                        if showError {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.footnote)
                        }
                    }
                    .padding()
                }
            }
            .padding()
        }
        .padding(.vertical)
    }
    
    private func validateAndSend() {
        guard !fullName.isEmpty, !phoneNumber.isEmpty else {
            showErrorMessage("Пожалуйста, заполните все поля.")
            return
        }
        
        let message = """
        Заявка от клиента:
        ФИО: \(fullName)
        Телефон: \(phoneNumber)
        """
        
        let urlString = "https://wa.me/\(defPhoneNumber)?text=\(message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            clearErrorMessage()
            UIApplication.shared.open(url)
        } else {
            showErrorMessage("WhatsApp не установлен.")
        }
    }
    
    private func clearErrorMessage() {
        errorMessage = ""
        showError = false
    }
    
    private func showErrorMessage(_ message: String) {
        errorMessage = message
        showError = true
    }
}

#Preview {
    ApplicationFormView()
}
