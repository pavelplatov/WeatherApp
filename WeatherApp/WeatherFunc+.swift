//
//  WeatherFunc+.swift
//  WeatherApp
//
//  Created by Павел Платов on 02.11.2023.
//

import Foundation

class getWeatherCall {
    func getWeather(city: String, completion: @escaping(Weather?) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=4f12d699987a1192ee8b96386ca4f3f5&units=metric") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherMain.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
                return
            } else {
                completion(nil)
            }
        }.resume()
    }
}
