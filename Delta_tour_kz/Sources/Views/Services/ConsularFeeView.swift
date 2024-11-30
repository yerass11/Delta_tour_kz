import SwiftUI

struct ConsularFeeView: View {
    let consularFees = [
        ("Американская виза", "$185"),
        ("Шенген виза", "€90"),
        ("Великобритания виза", "£155"),
        ("Японская виза", "Бесплатно") // Для Японии можно явно указать "Бесплатно"
    ]
    
    var body: some View {
        NavigationView {
            List(consularFees, id: \.0) { fee in
                HStack {
                    VStack(alignment: .leading) {
                        Text(fee.0) // Название визы
                            .font(.headline)
                        Text("Консульский сбор") // Подпись
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text(fee.1) // Сумма сбора
                        .font(.title3)
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Консульские сборы")
        }
    }
}

#Preview {
    ConsularFeeView()
}
