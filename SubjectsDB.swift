//
//  SubjectsDB.swift
//  timetable
//
//  Created by Victor Ursan on 9/27/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit
import CoreData

@objc(SubjectsDB)
class SubjectsDB: NSManagedObject {
  
  @NSManaged var cadruDidactic: String
  @NSManaged var disciplina: String
  @NSManaged var formatia: String
  @NSManaged var frecventa: String
  @NSManaged var grupa: String
  @NSManaged var orele: String
  @NSManaged var sala: String
  @NSManaged var tipul: String
  @NSManaged var ziua: String
  
}
