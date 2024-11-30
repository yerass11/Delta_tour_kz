import SwiftUI

struct FeedbackHeader: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color("leda2"), Color("leda")]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
            VStack(spacing: 10) {
                Text("Почему выбирают нас?")
                    .foregroundColor(.accent)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("• Более 800 оформленных виз. \nКаждый день за качественным оформлением виз в нашу компанию обращаются самые разные заявители. В офис нашей компании приходят разные люди : в основном люди заинтересованные в туризме, учебе и заработках.")
                    Text("• 87% клиентов получили. визы \nБлагодаря качественной работе наших сотрудников, большинство клиентов получают свои визы. Политика нашей компании заключается в том, чтобы каждый обратившийся заявитель получил свою заветную визу и отправился в путешествие своей мечты")
                    Text("•  Мы делаем быстро. \nНеважно, с какой целью вы наметили поездку – туризм, учеба, бизнес, посещение родственников, мы оформим вашу заявку и документы быстро и в кратчайшие сроки")
                    Text("Пусть ваше путешествие начнется с нами!")
                }
                .font(.system(size: 18))
            }
            .padding()
            .foregroundColor(.accent)
        }
    }
}

#Preview {
    FeedbackHeader()
}
