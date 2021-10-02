//
//  WeatherData.swift
//  Clima
//
//  Created by Le Hoang Anh on 01/10/2021.
//

struct WeatherData: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
