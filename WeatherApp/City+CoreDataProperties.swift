//
//  City+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Павел Платов on 02.11.2023.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var city: String?

}

extension City : Identifiable {

}
