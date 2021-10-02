//
//  WeatherViewController.swift
//  Clima
//
//  Created by Le Hoang Anh on 30/09/2021.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    
    let rootStackView = UIStackView()
    
    // search UIs.
    let searchStackView = UIStackView()
    let locationButton = UIButton()
    let searchButton = UIButton()
    let searchTextField = UITextField()
    
    // weather UIs.
    let conditionImageView = UIImageView()
    let temperatureLabel = UILabel()
    let cityLabel = UILabel()
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Apply delegate pattern.
        searchTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        style()
        layout()
        
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(locationButtonPressed), for: .touchUpInside)
    }

}


// MARK: - Auto Layout Programmatic
extension WeatherViewController {
 
    func makeTemperatureText(with temperature: String) -> NSAttributedString {
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.boldSystemFont(ofSize: 100)
        
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.foregroundColor] = UIColor.label
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 80)
        
        let text = NSMutableAttributedString(string: temperature, attributes: boldTextAttributes)
        text.append(NSMutableAttributedString(string: "°C", attributes: plainTextAttributes))
        
        return text
    }
    
    func style() {
        // backgroundImageView.
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        
        // rootStackView.
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.spacing = 10
        rootStackView.axis = .vertical
        rootStackView.alignment = .trailing
        
        // searchStackView.
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.spacing = 8
        
        // locationButton.
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        let locationImage = UIImage(systemName: "location.circle.fill")
        locationButton.setBackgroundImage(locationImage, for: .normal)
        locationButton.tintColor = .label
        
        // searchButton.
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        let searchImage = UIImage(systemName: "magnifyingglass")
        searchButton.setBackgroundImage(searchImage, for: .normal)
        searchButton.tintColor = .label
        
        // searchTextField.
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextField.placeholder = "Enter a city name"
        searchTextField.textAlignment = .right
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .systemFill
        searchTextField.clearButtonMode = .whileEditing
        
        // conditionImageView.
        conditionImageView.translatesAutoresizingMaskIntoConstraints = false
        conditionImageView.image = UIImage(systemName: "sun.max")
        conditionImageView.tintColor = .label
        
        // temperatureLabel.
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.font = UIFont.systemFont(ofSize: 80)
        temperatureLabel.attributedText = makeTemperatureText(with: "19")
        
        // cityLabel.
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        cityLabel.text = "London"
    }
    
    func layout() {
        // Add all subviews to view hierarchy.
        view.addSubview(backgroundImageView)
        view.addSubview(rootStackView)

        // Add all rootStackView's subviews.
        rootStackView.addArrangedSubview(searchStackView)
        rootStackView.addArrangedSubview(conditionImageView)
        rootStackView.addArrangedSubview(temperatureLabel)
        rootStackView.addArrangedSubview(cityLabel)
        
        // Add all searchStackView's subviews.
        searchStackView.addArrangedSubview(locationButton)
        searchStackView.addArrangedSubview(searchTextField)
        searchStackView.addArrangedSubview(searchButton)
        
        // Set constraints for all subviews.
        NSLayoutConstraint.activate([
            // backgroundImageView.
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            // rootStackView.
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: rootStackView.trailingAnchor, multiplier: 2),
            rootStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2 ),
            
            // searchStackView.
            searchStackView.widthAnchor.constraint(equalTo: rootStackView.widthAnchor),
            
            // locationButton.
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40),

            // searchButton.
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            // conditionImageView.
            conditionImageView.widthAnchor.constraint(equalToConstant: 120),
            conditionImageView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}


// MARK: - Button Actions
extension WeatherViewController {
    
    // searchButton.
    @objc func searchButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    // locationButton.
    @objc func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
}


// MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        }
        
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cityName = searchTextField.text, !cityName.isEmpty {
            weatherManager.fetchWeather(cityName: cityName)
        }
        
        searchTextField.text = ""
    }
    
}


// MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    
    func weatherManagerDidUpdate(_ manager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.temperatureLabel.attributedText = self.makeTemperatureText(with: weather.temperatureString)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func weatherManagerDidFail(with error: Error) {
        print(error.localizedDescription)
    }
    
}


// MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
}
