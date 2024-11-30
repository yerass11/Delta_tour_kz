import SwiftUI

struct FeedbackList: View {
    let message: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text(message)
                .foregroundColor(.accent)
                .font(.system(size: 16))
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
            Spacer()
            Image("visa")
                .resizable()
                .frame(width: 90, height: 70)
                .cornerRadius(8)
        }
        .padding()
        .background(
                       RoundedRectangle(cornerRadius: 16)
                           .fill(
                               LinearGradient(
                                   gradient: Gradient(colors: [Color("leda2"), Color("leda")]),
                                   startPoint: .leading,
                                   endPoint: .trailing
                               )
                           )
                   )
        .padding(.horizontal)
    }
}
