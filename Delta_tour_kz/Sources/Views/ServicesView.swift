//
//  ServicesPage.swift
//  Delta_tour_kz
//
//  Created by Yerasyl on 24.10.2024.
//

import SwiftUI
import SwiftSoup

struct ServicesView: View {
    @State private var dollarAmount: String = "1"
    @State private var conversionRate: Double = 0
    @State private var currencyRates: [CurrencyRate] = []
    
    var convertedAmount: Double {
        let dollars = Double(dollarAmount) ?? 0
        return dollars * conversionRate
    }
    
    var body: some View {
        ScrollView {
            
            infoAboutServices(serviceInfo: "Сервисный сбор", USDValue: 80)
            
            Divider()
            
            infoAboutServices(serviceInfo: "Консульский сбор", USDValue: 29.5)
            
            Divider()
            
            VStack(alignment: .leading) {
                showingText("Наши результаты")
                
                PhotoCaruselView(images: ["usa", "uk", "europe", "japan"])
                
                Divider()
                
                showingText("Выкуп круизов и тур пакетов")
                
                PhotoCaruselView(images: ["uk", "japan", "usa", "uk", "europe", "japan"])
                
                Divider()
                
                
                showingText("Языковые курсы и лагерь зарубежом для детей до 18 лет")
                
                PhotoCaruselView(images: ["europe", "japan", "usa", "uk", "europe", "japan"])
                
                Divider()
                
                
                showingText("Приглашения из США на конференции, приглашения в университет")
                
                PhotoCaruselView(images: ["japan", "europe", "usa", "uk", "europe", "japan"])
                
                Divider()
                
                showingText("Организация туров под ключ")
                
                PhotoCaruselView(images: ["usa", "europe", "japan", "uk", "europe", "japan"])
                
                Divider()
            }

            Spacer()
            
        }
        .padding()
        .onAppear(perform: checkAndFetchCurrencyRates)
    }
    
    func showingText(_ text: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.leda2)
            Text(text)
                .foregroundColor(.accent)
                .frame(alignment: .leading)
                .font(.title)
                .fontWeight(.bold)
                .padding()
        }
    }
    
    func infoAboutServices(serviceInfo: String, USDValue: Double) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.leda)
            
            HStack {
                Text(serviceInfo)
                    .foregroundColor(.accent)
                Spacer()
                Text("\(USDValue, specifier: "%.2f") USD / \(KZTvalue(USDvalue: USDValue), specifier: "%.2f") KZT")
                    .foregroundColor(.accent)
                    .font(.title2)
                    
            }
            .padding()
        }
    }
    
    func KZTvalue(USDvalue: Double) -> Double {
        return conversionRate * USDvalue
    }
    
    func checkAndFetchCurrencyRates() {
        let lastFetchDate = UserDefaults.standard.object(forKey: "lastFetchDate") as? Date ?? Date.distantPast
        let calendar = Calendar.current
        
        if !calendar.isDateInToday(lastFetchDate) {
            fetchCurrencyRates()
        } else {
            conversionRate = UserDefaults.standard.double(forKey: "savedConversionRate")
        }
    }
    
    func fetchCurrencyRates() {
        let url = URL(string: "https://nationalbank.kz/ru/exchangerates/ezhednevnye-oficialnye-rynochnye-kursy-valyut")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Ошибка при загрузке данных: \(error)")
                return
            }
            
            guard let data = data else {
                print("Нет данных")
                return
            }
            
            do {
                let html = String(data: data, encoding: .utf8)
                if let html = html {
                    parseHTML(html: html)
                }
            }
        }
        
        task.resume()
    }
    
    func parseHTML(html: String) {
        do {
            let document = try SwiftSoup.parse(html)
            let currencyTable = try document.select("table").first()
            
            if let currencyTable = currencyTable {
                let rows = try currencyTable.select("tr")
                var rates: [CurrencyRate] = []
                
                for row in rows.dropFirst() {
                    let columns = try row.select("td")
                    if columns.count >= 4 {
                        let currencyName = try columns[1].text()
                        let currencyCode = try columns[2].text()
                        let currencyRateString = try columns[3].text().replacingOccurrences(of: ",", with: ".")
                        
                        if let currencyRate = Double(currencyRateString) {
                            let currencyRateObject = CurrencyRate(currency: currencyName, code: currencyCode, rate: currencyRate)
                            rates.append(currencyRateObject)
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    self.currencyRates = rates
                    if let dollarRate = rates.first(where: { $0.currency.contains("ДОЛЛАР США") }) {
                        self.conversionRate = dollarRate.rate
                        saveConversionRate(dollarRate.rate)
                    }
                }
            }
        } catch {
            print("Ошибка при парсинге HTML: \(error)")
        }
    }
    
    func saveConversionRate(_ rate: Double) {
        UserDefaults.standard.set(rate, forKey: "savedConversionRate")
        UserDefaults.standard.set(Date(), forKey: "lastFetchDate")
    }
}

#Preview {
    ServicesView()
}
