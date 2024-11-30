import SwiftUI

struct FeedbackView: View {
    @State private var showSheet = false
    
    let imageNames = (1...28).map { "result\($0)" }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color("leda2"), Color("leda")]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(height: 240)

                    NavigationLink(destination: HighlightsView()) {
                            VStack {
                                ZStack {
                                    Image("feedback_logo")
                                        .resizable()
                                        .frame(width: 100, height: 160)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                                                .shadow(radius: 5)
                                        )
                                }
                                Text("Отзывы")
                                    .offset(y: -30)
                            }
                            .padding()
                    }
                    .frame(width: 150)
                }

                
                
                VStack(spacing: 20) {
                    FeedbackHeader()
                    PhotoCaruselView(images: imageNames)
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    FeedbackView()
}
