import Foundation

struct WeatherModel: Codable {
    var city: String = ""
    var hourly: [WeatherHourly]
    var daily: [WeatherDaily]
    
    enum CodingKeys: CodingKey {
        case hourly
        case daily
    }
}

struct WeatherDetail: Codable {
    let icon: String
    let weatherDescription: String
    
    enum CodingKeys: String, CodingKey {
        case icon
        case weatherDescription = "description"
    }
}

struct WeatherHourly: Codable {
    let temp: Double
    let time: Int
    let weatherDetail: [WeatherDetail]
    
    enum CodingKeys: String, CodingKey {
        case temp
        case time = "dt"
        case weatherDetail = "weather"
    }
}

struct WeatherDaily: Codable {
    let dt: Int
    let temp: Temp
    let humidity: Int
    let weather: [WeatherDetail]
    let pop: Double
}

struct Temp: Codable {
    let min: Double
    let max: Double
    let night: Double
}

