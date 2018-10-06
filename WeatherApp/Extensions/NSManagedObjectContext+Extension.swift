//
//  NSManagedObjectContext+Extension.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 10/5/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func removeAll(exept object: NSManagedObject? = nil) {
        
        for _object in insertedObjects {
            if _object == object {
                print("equal")
            }else{
                self.delete(_object)
            }
        }
    }
}
