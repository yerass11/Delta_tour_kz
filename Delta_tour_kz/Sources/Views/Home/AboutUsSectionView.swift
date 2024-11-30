import SwiftUI

struct AboutUsSectionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Кто мы?")
                .foregroundColor(.accent)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            YouTubeShortsWebView(shortsURL: "https://youtube.com/shorts/8ELF6raF26U")
                .frame(height: 400) // Настройка высоты
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Text(infoText)
                .padding()
                .foregroundColor(.accent)
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
                .font(.body)
        }
    }
    
    private var infoText: String {
        """
        Delta Tour KZ — это команда профессионалов, которая уже много лет помогает людям открывать мир. Мы специализируемся на оформлении виз для любых целей: будь то туризм, учеба, работа или деловые поездки. Наш опыт и глубокое знание визовых процедур позволяют нам предоставлять клиентам полный спектр услуг, начиная от первичной консультации и заканчивая сопровождением на всех этапах оформления.
        
        Мы понимаем, что визовый процесс может быть сложным и запутанным, поэтому берем на себя все заботы, чтобы вы могли сосредоточиться на предстоящем путешествии. В нашей работе мы ценим честность, оперативность и индивидуальный подход к каждому клиенту. Delta Tour KZ — ваш надежный партнер на пути к новым горизонтам!
        """
    }
}

#Preview {
    AboutUsSectionView()
}
