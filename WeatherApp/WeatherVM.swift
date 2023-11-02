//
//  WeatherVM.swift
//  WeatherApp
//
//  Created by Павел Платов on 02.11.2023.
//

import Foundation
import Combine

class WeatherVM: ObservableObject {
    private var weatherFunc: getWeatherCall!
    
    @Published var weather = Weather()
    
    init() {
        self.weatherFunc = getWeatherCall()
        
    }
    var cityName: String = ""
    
    var temperature: String {
        if let temp = self.weather.temp {
            let stringTemp = String(format: "%.0f", temp)
            return stringTemp + "°"
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let hum = self.weather.humidity {
            let stringHum = String(format: "%.0f", hum)
            return stringHum + "°"
        } else {
            return ""
        }
    }
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    func loadCities() -> [City] {
        let cities = CityDataManager.shared.fetchCities()
        return cities
    }

            
            private func fetchWeather(by city: String) {
                self.weatherFunc.getWeather(city: city) { weather in
                    if let weather = weather {
                        DispatchQueue.main.async {
                            self.weather = weather
                        }
                    }
                }
            }
        }
    
