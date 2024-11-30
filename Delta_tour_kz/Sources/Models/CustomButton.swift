import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    let icon: ButtonIcon
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color("leda"), Color("leda2")]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.accent, lineWidth: 2)
                        )
                    .frame(width: 180, height: 36)
                
                HStack {
                    if let systemIcon = icon.systemName {
                        Image(systemName: systemIcon)
                            .font(.system(size: 20))
                    } else if let customImage = icon.customImageName {
                        Image(customImage)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    Text(title)
                        .foregroundColor(.accent)
                }
            }
        }
    }
}
