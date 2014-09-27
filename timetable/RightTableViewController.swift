//
//  RightTableViewController.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 8/12/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

protocol RightTableViewControllerDelegate {
  func dataWithDay(#ziua: String, disciplina: String, tipul: String)
}

class RightTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var tableView: UITableView!
  var delegate: RightTableViewControllerDelegate
  var dataHandler: DataDBHandler
  
  let tableViewValues: [String] = ["Ziua:", "Disciplina:", "Tipul:"]
  let daysArray = ["Luni", "Marti", "Miercuri", "Joi", "Vineri"]
  var daysDictionary = ["Luni" : 0, "Marti" : 0, "Miercuri" : 0, "Joi" : 0, "Vineri" : 0]
  var subjectsArray: [String] = []
  var subjectsDictionary: [String : Int] = [:]
  let typeArray = ["Curs", "Seminar", "Laborator"]
  var typeDictionary = ["Curs" : 0, "Seminar" : 0, "Laborator" : 0]
  var countForArrays: [Int] = []
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(dataHandler: DataDBHandler, delegate: RightTableViewControllerDelegate) {
    self.dataHandler = dataHandler
    self.delegate = delegate
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = UIColor(red: 0.0039, green: 0.3411, blue: 0.615686, alpha: 1)
    tableView = UITableView(frame: CGRectMake(0, 30, 240, view.frame.size.height-30))
    tableView.delegate = self
    tableView.dataSource = self
    tableView.sectionHeaderHeight = 40
    view.addSubview(tableView)
    loadSubjectsArray()
  }
  
  // MARK: - Table view data source
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 3
  }
  
  override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
    tableView.frame = CGRectMake(0, 30, 240, view.frame.size.height-30)
    super.didRotateFromInterfaceOrientation(fromInterfaceOrientation)
  }
  
  func loadSubjectsArray() {
    if subjectsArray != dataHandler.allSubjectsName() {
      subjectsArray = dataHandler.allSubjectsName()
      subjectsArray.map{subj in self.subjectsDictionary[subj] = 0}
      typeDictionary = ["Curs" : 0, "Seminar" : 0, "Laborator" : 0]
      daysDictionary = ["Luni" : 0, "Marti" : 0, "Miercuri" : 0, "Joi" : 0, "Vineri" : 0]
    }
    countForArrays = [daysArray.count, subjectsArray.count, typeArray.count]
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if !countForArrays.isEmpty {
      return countForArrays[section]
    }
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier") as? UITableViewCell
    if cell == nil {
      cell = UITableViewCell(style: UITableViewCellStyle.Default , reuseIdentifier: "reuseIdentifier")
    }
    switch indexPath.section {
    case 0:
      cell!.textLabel!.text = daysArray[indexPath.row]
      if daysDictionary[daysArray[indexPath.row]] == 0 {
        cell!.accessoryType = .None
      } else {
        cell!.accessoryType = .Checkmark
      }
    case 1:
      cell!.textLabel!.text = subjectsArray[indexPath.row]
      if subjectsDictionary[subjectsArray[indexPath.row]] == 0 {
        cell!.accessoryType = .None
      } else {
        cell!.accessoryType = .Checkmark
      }
    case 2:
      cell!.textLabel!.text = typeArray[indexPath.row]
      if typeDictionary[typeArray[indexPath.row]] == 0 {
        cell!.accessoryType = .None
      } else {
        cell!.accessoryType = .Checkmark
      }
    default: ""
    }
    return cell!
  }
  
  func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    switch indexPath.section {
    case 0:
      if daysDictionary[daysArray[indexPath.row]] == 0 {
        for (key, value) in daysDictionary {daysDictionary[key] = 0}
        daysDictionary[daysArray[indexPath.row]] = 1
      } else {
        daysDictionary[daysArray[indexPath.row]] = 0
      }
    case 1:
      if subjectsDictionary[subjectsArray[indexPath.row]] == 0 {
        for (key, value) in subjectsDictionary {subjectsDictionary[key] = 0}
        subjectsDictionary[subjectsArray[indexPath.row]] = 1
      } else {
        subjectsDictionary[subjectsArray[indexPath.row]] = 0
      }
    case 2:
      if typeDictionary[typeArray[indexPath.row]] == 0 {
        for (key, value) in typeDictionary {typeDictionary[key] = 0}
        typeDictionary[typeArray[indexPath.row]] = 1
      } else {
        typeDictionary[typeArray[indexPath.row]] = 0
      }
    default: ""
    }
    tableView.reloadData()
  }
  
  func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
    return tableViewValues[section]
  }
  
  override func viewWillAppear(animated: Bool) {
    loadSubjectsArray()
    tableView.reloadData()
    super.viewWillAppear(animated)
  }
  
  override func viewWillDisappear(animated: Bool) {
    var ziua = ""
    var disciplina = ""
    var tipul = ""
    for (key, value) in daysDictionary {
      if value == 1 { ziua = key; break }
    }
    for (key, value) in subjectsDictionary {
      if value == 1 { disciplina = key; break }
    }
    for (key, value) in typeDictionary {
      if value == 1 { tipul = key; break }
    }
    delegate.dataWithDay(ziua: ziua, disciplina: disciplina, tipul: tipul)
    super.viewWillDisappear(animated)
  }
  
}
