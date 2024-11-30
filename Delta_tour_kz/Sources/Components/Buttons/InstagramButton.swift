import SwiftUI

struct InstagramButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.accent, lineWidth: 2)
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
    }
}
