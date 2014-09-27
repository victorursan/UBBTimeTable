//
//  DataDBHandler.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 8/10/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit
import CoreData

class DataDBHandler: NSObject {
  
  private var context: NSManagedObjectContext
  private let myEntity: NSString = "SubjectsDB"
  
  override init() {
    var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
    context = appDel.managedObjectContext!
    super.init()
  }
  
  func saveDataFor(url: NSURL) {
    deleteEverythingInDataBase()
    var dataDictionary: [String : [Int : [String]]] = DataHTMLParserHandler().contentForURL(url)
    for (key, value) in dataDictionary {
      for (position, subject) in value {
        saveSubjectFromArray(subject+["\(key)"])
      }
    }
  }
  
  func saveSubjectFromArray(array: [String]) {
    var error: NSError?
    var entity = NSEntityDescription.entityForName(myEntity, inManagedObjectContext: context)
    var subject = SubjectsDB(entity: entity!, insertIntoManagedObjectContext: context)
    subject.ziua =          array[0]
    subject.orele =         array[1]
    subject.frecventa =     array[2]
    subject.sala =          array[3]
    subject.formatia =      array[4]
    subject.tipul =         array[5]
    subject.disciplina =    array[6]
    subject.cadruDidactic = array[7]
    subject.grupa =         array[8]
    context.save(&error)
    if (error != nil) { println(error) }
  }
  
  func allSubjectsName() -> [String] {
    var error: NSError?
    var entity = NSEntityDescription.entityForName(myEntity, inManagedObjectContext: context)
    var request = NSFetchRequest(entityName: myEntity)
    if let entityProperties = entity?.propertiesByName {
      request.propertiesToFetch = NSArray(object: entityProperties["disciplina"]!)
      request.returnsObjectsAsFaults = false
      request.returnsDistinctResults = true
      request.resultType = NSFetchRequestResultType.DictionaryResultType
      var result = context.executeFetchRequest(request, error: &error) as [[String : String]]
      var finalResult: [String] = []
      result.map{ dictionary in finalResult.append(dictionary["disciplina"]! as String)}
      if (error != nil) { println(error) }
      return sorted(finalResult, {$0 < $1})
    }
    return []
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
  
  func subjectsForFilter(#ziua: String, disciplina: String, tipul: String) -> [Subject]{
    var grupa: String = SettingsDBHandler().grupa()
    var error: NSError?
    var request = NSFetchRequest(entityName: myEntity)
    request.returnsObjectsAsFaults = false
    var array: [NSPredicate] = []
    
    if ziua != "" {
      array.append(NSPredicate(format: "ziua == %@", ziua))
    }; if tipul != "" {
      array.append(NSPredicate(format: "tipul == %@", tipul))
    };if disciplina != "" {
      array.append(NSPredicate(format: "disciplina == %@", disciplina))
    } else if grupa != "" {
      array.append(NSPredicate(format: "grupa == %@", grupa))
    }
    
    request.predicate = NSCompoundPredicate.andPredicateWithSubpredicates(array)
    let requestResult = context.executeFetchRequest(request, error: &error) as [SubjectsDB]
    let result: [Subject] = requestResult.map{subj in return Subject(grupa: subj.grupa, ziua: subj.ziua, orele: subj.orele,
      frecventa: subj.frecventa, sala: subj.sala, formatia: subj.formatia,
      tipul: subj.tipul, disciplina: subj.disciplina, cadruDidactic: subj.cadruDidactic)}
    var finalResult: [Subject] = []
    for subject in result {
      var bool = false
      for toCompare in finalResult {
        if subject.isEqualTo(toCompare) {
          bool = true
        }
      }
      if !bool {
        finalResult.append(subject)
      }
    }
    return CustomSort().sortSubjects(finalResult)
  }
}