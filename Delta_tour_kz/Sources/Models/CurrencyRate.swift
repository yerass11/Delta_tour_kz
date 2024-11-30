import Foundation

struct CurrencyRate: Identifiable, Codable {
    let id: UUID = UUID()
    let currency: String
    let code: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case currency = "Валюта"
        case code = "Код"
        case rate = "Курс"
    }
}
