import SwiftUI

struct ServiceChargeView: View {
    let serviceInfo: String
    let USDValue: Double
    let conversionRate: Double
    
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
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(serviceInfo) // Название услуги
                        .font(.headline)
                        .foregroundColor(.accent)
                    
                    Text("Консульский сбор")
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.8))
                }
                Spacer()
                Text("\(USDValue, specifier: "%.2f") USD / \(KZTvalue(USDvalue: USDValue), specifier: "%.2f") KZT")
                    .foregroundColor(.accent)
                    .font(.title2)
            }
            .padding()
        }
    }
    
    func KZTvalue(USDvalue: Double) -> Double {
        USDvalue * conversionRate
    }
}
