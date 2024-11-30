import SwiftUI

struct FieldStyle: TextFieldStyle {
    let background: Color
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .font(.system(size: 14))
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(background))
            .foregroundColor(.accent)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.accent.opacity(0.5), lineWidth: 1)
            )
            .padding(.vertical, 4)
    }
}
