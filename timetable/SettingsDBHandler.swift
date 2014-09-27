//
//  SettingsDBHandler.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/8/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit
import CoreData

class SettingsDBHandler: NSObject {
  
  private var context: NSManagedObjectContext
  private let myEntity: NSString = "SettingsDB"
  
  override init() {
    var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
    context = appDel.managedObjectContext!
    super.init()
  }
  
  func saveSettingsWith(#studiu: String, specializarea: String, an: String, group: String, link: String) {
    deleteEverythingInDataBase()
    var error: NSError?
    var entity = NSEntityDescription.entityForName(myEntity, inManagedObjectContext: context)
    var settings = SettingsDB(entity: entity!, insertIntoManagedObjectContext: context)
    settings.studiu = studiu
    settings.specializarea = specializarea
    settings.an = an
    settings.grupa = group
    settings.link = link
    context.save(&error)
    if (error != nil) { println(error) }
  }
  
  func settingsSaved() -> [String]? {
    var error: NSError?
    var request = NSFetchRequest(entityName: myEntity)
    request.returnsObjectsAsFaults = false
    var result = context.executeFetchRequest(request, error: &error) as [SettingsDB]
    for setting in result {
      return [setting.studiu, setting.specializarea, setting.an, setting.grupa, setting.link]
    }
    if (error != nil) { println(error) }
    return nil
  }
  
  func grupa() -> String {
    var error: NSError?
    var entity = NSEntityDescription.entityForName(myEntity, inManagedObjectContext: context)
    var request = NSFetchRequest(entityName: myEntity)
    if let entityProperties = entity?.propertiesByName {
      request.propertiesToFetch = NSArray(object: entityProperties["grupa"]!)
      request.returnsObjectsAsFaults = false
      request.returnsDistinctResults = true
      request.resultType = NSFetchRequestResultType.DictionaryResultType
      var result = context.executeFetchRequest(request, error: &error) as [[String : String]]
      for dictionary in result {
        return dictionary["grupa"]!
      }
      if (error != nil) { println(error) }
    }
    return ""
  }
  
  func deleteEverythingInDataBase() {
    var error: NSError?
    var request = NSFetchRequest(entityName: myEntity)
    request.returnsObjectsAsFaults = false
    var objects = context.executeFetchRequest(request, error: &error) as [NSManagedObject]
    for object in objects {
      context.deleteObject(object)
    }
    context.save(&error)
    if (error != nil) { println(error) }
  }
  
}
