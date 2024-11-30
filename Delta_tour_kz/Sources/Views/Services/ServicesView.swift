import SwiftUI
import SwiftSoup

struct ServicesView: View {
    @State private var dollarAmount: String = "1"
    @State private var euroAmount: String = "1"
    @State private var funtAmount: String = "1"
    
    @State private var conversionRateDollar: Double = 0
    @State private var conversionRateEuro: Double = 0
    @State private var conversionRateFunt: Double = 0
    
    
    @State private var currencyRates: [CurrencyRate] = []
    let images: [String] = (1...3).map { "visa\($0)" }
    
    var convertedAmountDollar: Double {
        (Double(dollarAmount) ?? 0) * conversionRateDollar
    }
    
    var convertedAmountEuro: Double {
        (Double(euroAmount) ?? 0) * conversionRateEuro
    }
    var convertedAmountFunt: Double {
        (Double(funtAmount) ?? 0) * conversionRateFunt
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                PhotoCaruselView(images: images)
                ServiceChargeView(serviceInfo: "Американская виза", USDValue: 185, conversionRate: conversionRateDollar)
                Divider()
                ServiceChargeView(serviceInfo: "Шенген виза", USDValue: 90, conversionRate: conversionRateEuro)
                Divider()
                ServiceChargeView(serviceInfo: "Великобритания виза", USDValue: 29.5, conversionRate: conversionRateDollar)
                Divider()
                ServiceChargeView(serviceInfo: "Японская виза", USDValue: 29.5, conversionRate: conversionRateDollar)
                Divider()
                
                
                
                ForEach(serviceData, id: \.title) { service in
                    ServiceCategoryView(title: service.title, images: service.images)
                }
            }
            .padding()
            .onAppear(perform: updateCurrencyRates)
        }
        .padding(.vertical)
    }
    
    let serviceData: [ServiceSection] = [
        ServiceSection(title: "Наши результаты", images: ["usa", "uk", "europe", "japan"]),
        ServiceSection(title: "Выкуп круизов и тур пакетов", images: ["uk", "japan", "usa", "uk", "europe", "japan"]),
        ServiceSection(title: "Языковые курсы и лагерь за рубежом для детей до 18 лет", images: ["europe", "japan", "usa", "uk", "europe", "japan"]),
        ServiceSection(title: "Приглашения из США на конференции, приглашения в университет", images: ["japan", "europe", "usa", "uk", "europe", "japan"]),
        ServiceSection(title: "Организация туров под ключ", images: ["usa", "europe", "japan", "uk", "europe", "japan"])
    ]
    
    func updateCurrencyRates() {
        print("Dollar Rate: \(self.conversionRateDollar)")
        print("Euro Rate: \(self.conversionRateEuro)")
        print("Funt Rate: \(self.conversionRateFunt)")

        let lastFetchDate = UserDefaults.standard.object(forKey: "lastFetchDate") as? Date ?? Date.distantPast
        let calendar = Calendar.current
        
        if !calendar.isDateInToday(lastFetchDate) {
            loadCurrencyRates()
        } else {
            conversionRateDollar = UserDefaults.standard.double(forKey: "savedConversionRate")
            
            conversionRateEuro = UserDefaults.standard.double(forKey: "savedConversionRate")
            
            conversionRateFunt = UserDefaults.standard.double(forKey: "savedConversionRate")
        }
    }
    
    func loadCurrencyRates() {
        guard let url = URL(string: "https://nationalbank.kz/ru/exchangerates/ezhednevnye-oficialnye-rynochnye-kursy-valyut") else {
            print("Некорректный URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Ошибка при загрузке данных: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let html = String(data: data, encoding: .utf8) else {
                print("Не удалось загрузить данные")
                return
            }
            
            parseCurrencyRatesFromHTML(html: html)
        }
        
        task.resume()
    }
    
    func parseCurrencyRatesFromHTML(html: String) {
        do {
            let document = try SwiftSoup.parse(html)
            guard let currencyTable = try document.select("table").first() else {
                print("Таблица курсов не найдена")
                return
            }
            
            let rows = try currencyTable.select("tr")
            var rates: [CurrencyRate] = []
            
            for row in rows.dropFirst() {
                let columns = try row.select("td")
                if columns.count >= 4 {
                    let currencyName = try columns[1].text()
                    let currencyCode = try columns[2].text()
                    let currencyRateString = try columns[3].text().replacingOccurrences(of: ",", with: ".")
                    
                    if let currencyRate = Double(currencyRateString) {
                        rates.append(CurrencyRate(currency: currencyName, code: currencyCode, rate: currencyRate))
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.currencyRates = rates
                
                if let dollarRate = rates.first(where: { $0.currency.contains("ДОЛЛАР США") }) {
                    self.conversionRateDollar = dollarRate.rate
                    saveConversionRate(dollarRate.rate, for: "Dollar")
                }
                if let euroRate = rates.first(where: { $0.currency.contains("ЕВРО") }) {
                    self.conversionRateEuro = euroRate.rate
                    saveConversionRate(euroRate.rate, for: "Euro")
                }
                if let funtRate = rates.first(where: { $0.currency.contains("ФУНТ СТЕРЛИНГОВ СОЕДИНЕННОГО КОРОЛЕВСТВА") }) {
                    self.conversionRateFunt = funtRate.rate
                    saveConversionRate(funtRate.rate, for: "Funt")
                }

            }
        } catch {
            print("Ошибка при парсинге HTML: \(error.localizedDescription)")
        }
    }
    
    func saveConversionRate(_ rate: Double, for currency: String) {
        let key = "savedConversionRate\(currency)"
        UserDefaults.standard.set(rate, forKey: key)
        UserDefaults.standard.set(Date(), forKey: "lastFetchDate")
    }

}

#Preview {
    ServicesView()
}
