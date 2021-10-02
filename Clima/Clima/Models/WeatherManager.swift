//
//  WeatherManager.swift
//  Clima
//
//  Created by Le Hoang Anh on 01/10/2021.
//

import UIKit
import CoreLocation

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    let apiKey = "c30a93f4745c8e3513c166c7a051e7e9"
    let unitTemperature = "metric"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)?appid=\(apiKey)&units=\(unitTemperature)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)?appid=\(apiKey)&units=\(unitTemperature)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                delegate?.weatherManagerDidFail(with: error)
                return
            }
            
            if let data = data, let weatherModel = parseJSON(data) {
                delegate?.weatherManagerDidUpdate(self, weather: weatherModel)
            }
        }
        
        task.resume()
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            return WeatherModel(conditionId: decodedData.weather[0].id,
                                temperature: decodedData.main.temp,
                                cityName: decodedData.name)
        } catch {
            delegate?.weatherManagerDidFail(with: error)
            return nil
        }
    }
    
}
