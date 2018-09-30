//
//  User.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/29/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
class User: NSManagedObject {

    @NSManaged var name: String?

}

extension User {
    
    func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest(entityName: "User")
    }
   
    
}
