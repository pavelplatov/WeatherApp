//
//  ContentView.swift
//  WeatherApp
//
//  Created by Павел Платов on 02.11.2023.
//MARK: Не успеваю реализовать добавление городов, бд сделал

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel: WeatherVM
    
    init() {
        self.weatherViewModel = WeatherVM()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .bottom, endPoint: .top)
            
            VStack {
                Text("Погода")
                    .font(.largeTitle)
                TextField("Поиск города", text: self.$weatherViewModel.cityName) {
                    self.weatherViewModel.search()
                }
                        .multilineTextAlignment(.center)
                HStack(spacing: 10) {
                    Text("🌡")
                        .font(.system(size: 40))
                        .padding()
                    Text("Температура")
                        .font(.title)
                        .padding()
                    Text(self.weatherViewModel.temperature)
                        .font(.title)
                    Spacer()
                }
                HStack(spacing: 10) {
                    Text("💧")
                        .font(.system(size: 40))
                        .padding()
                    Text("Влажность")
                        .font(.title)
                        .padding()
                    Text(self.weatherViewModel.humidity)
                    Spacer()
                    
                    }
                }
            }
        .ignoresSafeArea()
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
