//
//  SettingsHandler.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/3/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class SettingsHandler: NSObject {
  
  var options: [String : [String : [Anul]]]?
  var studii: [String]?
  var specializari: [String]?
  var anii: [Anul]?
  var groups: [String]?
  
  var settingsDBHandler: SettingsDBHandler = SettingsDBHandler()
  var dataHandler: DataDBHandler
  
  var studiuSelectat: String?
  var specializareSelectata: String?
  var anulSelectat: Anul?
  var grupaSelectata: String?
  
  init(dataHandler: DataDBHandler) {
    self.dataHandler = dataHandler
    super.init()
  }
  
  func getStudii() -> [String] {
    options = SettingsHTMLParserHandler().contentForURL(URLMaker().urlForYear())
    studii = sorted(Array(options!.keys), {$0 < $1})
    return studii!
  }
  
  func setStudiu(studiu: String) {
    studiuSelectat = studiu
    specializari =  sorted(Array(options![studiuSelectat!]!.keys), {$0 < $1})
  }
  
  func deleteStudiu() {
    studiuSelectat = nil
  }
  
  func getSpecializari() -> [String] {
    if (studiuSelectat? != nil) {
      return specializari!
    }
    return []
  }
  
  func setSpecializare(specializarea: String) {
    specializareSelectata = specializarea
    anii = Array(options![studiuSelectat!]![specializareSelectata!]!)
    anii!.sort{$0.descriere < $1.descriere}
  }
  
  func deleteSpecializare() {
    specializareSelectata = nil
  }
  
  func getAnii() -> [String] {
    if (specializareSelectata? != nil) {
      setAnul(anii![0].descriere)
      return anii!.map{$0.descriere}
    }
    return []
  }
  
  func setAnul(anul: String) {
    anulSelectat = anii!.filter({$0.descriere == anul})[0]
  }
  
  func deleteAnul() {
    anulSelectat = nil
  }
  
  func getGrupe() -> [String] {
    if (anulSelectat? != nil) {
      groups = SettingsHTMLParserHandler().groupsForURL(URLMaker().urlForData(anulSelectat!.link))
      groups!.sort{ $0 < $1 }
      setGrupe(groups![0])
      return groups!
    }
    return []
  }
  
  func setGrupe(grupa: String) {
    grupaSelectata = grupa
  }
  
  func deleteGrupe() {
    grupaSelectata = nil
  }
  
  func saveSettingsData() {
    settingsDBHandler.saveSettingsWith(studiu: studiuSelectat!,
      specializarea: specializareSelectata!,
      an: anulSelectat!.descriere,
      group: grupaSelectata!,
      link: anulSelectat!.link)
    dataHandler.saveDataFor(URLMaker().urlForData(anulSelectat!.link))
  }
  
  func areSettingsMissing() -> Bool {
    return (grupaSelectata? == nil)
  }
  
  func refreshSettingsData() {
    options = SettingsHTMLParserHandler().contentForURL(URLMaker().urlForYear())
    let data = settingsDBHandler.settingsSaved()!
    setStudiu(data[0])
    setSpecializare(data[1])
    setAnul(data[2])
    setGrupe(data[3])
    options = SettingsHTMLParserHandler().contentForURL(URLMaker().urlForYear())
    dataHandler.saveDataFor(URLMaker().urlForData(anulSelectat!.link))
    
  }
  
}
