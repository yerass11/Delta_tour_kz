//
//  CurrencyRate.swift
//  Delta_tour_kz
//
//  Created by Yerasyl on 29.10.2024.
//

import Foundation

struct CurrencyRate: Identifiable, Codable {
    let id: UUID = UUID()  // Генерация уникального ID
    let currency: String
    let code: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case currency = "Валюта"
        case code = "Код"
        case rate = "Курс"
    }
}
