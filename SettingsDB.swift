//
//  SettingsDB.swift
//  timetable
//
//  Created by Victor Ursan on 9/27/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit
import CoreData

@objc(SettingsDB)
class SettingsDB: NSManagedObject {
  
  @NSManaged var an: String
  @NSManaged var grupa: String
  @NSManaged var link: String
  @NSManaged var specializarea: String
  @NSManaged var studiu: String
  
}
