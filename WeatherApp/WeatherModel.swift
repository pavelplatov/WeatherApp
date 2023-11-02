//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Павел Платов on 02.11.2023.
//

import Foundation
struct WeatherMain: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
