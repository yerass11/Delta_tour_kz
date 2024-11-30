import SwiftUI


struct HelpButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.accent, lineWidth: 2)
                    .frame(width: 180, height: 36)
                
                HStack {
                    Image(systemName: "ellipsis.message")
                        .font(.system(size: 20))
                    Text("Нужна помощь?")
                        .foregroundColor(.accent)
                }
            }
        }
    }
}
