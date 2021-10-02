//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Le Hoang Anh on 01/10/2021.
//

protocol WeatherManagerDelegate {
    func weatherManagerDidUpdate(_ manager: WeatherManager, weather: WeatherModel)
    func weatherManagerDidFail(with error: Error)
}
