//
//  City+CoreDataClass.swift
//  WeatherApp
//
//  Created by Павел Платов on 02.11.2023.
//
//

import Foundation
import CoreData

@objc(City)
public class City: NSManagedObject {
        @NSManaged public var temperature: Double
        @NSManaged public var humidity: Double
}

