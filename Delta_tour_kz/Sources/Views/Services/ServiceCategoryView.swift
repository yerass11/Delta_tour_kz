import SwiftUI

struct ServiceCategoryView: View {
    let title: String
    let images: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color("leda2"), Color("leda")]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                Text(title)
                    .foregroundColor(.accent)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
            }
            PhotoCaruselView(images: images)
        }
    }
}
