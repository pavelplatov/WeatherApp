//
//  CityDataManager.swift
//  WeatherApp
//
//  Created by Павел Платов on 02.11.2023.
//

import Foundation
import CoreData

class CityDataManager {
    static let shared = CityDataManager()
    
    private let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreData")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading Core Data: \(error)")
            }
        }
    }
    
    func saveCity(name: String, temperature: Double, humidity: Double) {
        let context = persistentContainer.viewContext
        let city = City(context: context)
        city.city = name
        city.temperature = temperature
        city.humidity = humidity
        
        do {
            try context.save()
        } catch {
            print("Error saving city: \(error)")
        }
    }
    
    func fetchCities() -> [City] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<City> = City.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Error fetching cities: \(error)")
            return []
        }
    }
}
