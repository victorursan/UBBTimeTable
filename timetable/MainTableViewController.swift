//
//  MainTableViewController.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 8/11/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RightTableViewControllerDelegate, LeftTableViewControllerDelegate {
  
  var tableView: UITableView!
  var dataHandler: DataDBHandler
  var tableData: [Subject] = []
  var elementsNotInDescription: NSMutableArray = []
  var missingDataView: MissingDataView?
  var filters: [String] = []
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(dataHandler: DataDBHandler) {
    self.dataHandler = dataHandler
    super.init(nibName: nil, bundle: nil)
    
    navigationItem.rightBarButtonItem = MMDrawerBarButtonItem(title: "Filter", style: .Plain, target: self, action: "filterButtonPressed")
    navigationItem.leftBarButtonItem = MMDrawerBarButtonItem(title: "Menu", style: .Plain, target: self, action: "menuButtonPressed")
    
    implementTableView()
    filters = [Date().dayString()]
    pullDataFromDBForDay(Date().dayString())
  }
  
  override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
    if SettingsDBHandler().settingsSaved() == nil {
      if missingDataView != nil {
        missingDataView!.removeFromSuperview()
      }
      if fromInterfaceOrientation == UIInterfaceOrientation.Portrait {
        missingDataView = MissingDataView.viewForNoDataInDBWith(frame: view.frame, landscape: true)
      } else {
        missingDataView = MissingDataView.viewForNoDataInDBWith(frame: view.frame, landscape: false)
      }
      view.addSubview(missingDataView!)
    } else if tableData.count == 0 {
      if missingDataView != nil {
        missingDataView!.removeFromSuperview()
      }
      if fromInterfaceOrientation == UIInterfaceOrientation.Portrait {
        missingDataView = MissingDataView.viewForNoDataWithFilter(frame: view.frame, filters: filters, landscape: true)
      } else {
        missingDataView = MissingDataView.viewForNoDataWithFilter(frame: view.frame, filters: filters, landscape: false)
      }
      view.addSubview(missingDataView!)
    } else if missingDataView != nil {
      missingDataView!.removeFromSuperview()
      missingDataView = nil
    }
    tableView.frame = view.frame
    super.didRotateFromInterfaceOrientation(fromInterfaceOrientation)
  }
  
  override func viewWillAppear(animated: Bool) {
    let orientation: UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
    if SettingsDBHandler().settingsSaved() == nil {
      if missingDataView != nil {
        missingDataView!.removeFromSuperview()
      }
      if orientation == UIInterfaceOrientation.Portrait {
        missingDataView = MissingDataView.viewForNoDataInDBWith(frame: view.frame, landscape: false)
      } else {
        missingDataView = MissingDataView.viewForNoDataInDBWith(frame: view.frame, landscape: true)
      }
      view.addSubview(missingDataView!)
    } else if tableData.count == 0 {
      if missingDataView != nil {
        missingDataView!.removeFromSuperview()
      }
      if orientation == UIInterfaceOrientation.Portrait {
        missingDataView = MissingDataView.viewForNoDataWithFilter(frame: view.frame, filters: filters, landscape: false)
      } else {
        missingDataView = MissingDataView.viewForNoDataWithFilter(frame: view.frame, filters: filters, landscape: true)
      }
      view.addSubview(missingDataView!)
    } else if missingDataView != nil {
      missingDataView!.removeFromSuperview()
      missingDataView = nil
    }
    
    tableView.frame = view.frame
    super.viewWillAppear(animated)
  }
  
  func implementTableView() {
    tableView = UITableView(frame: view.frame)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.allowsSelection = false
    view.addSubview(tableView)
  }
  
  func filterButtonPressed() {
    mm_drawerController.toggleDrawerSide(MMDrawerSide.Right, animated: true, completion: nil)
  }
  
  func menuButtonPressed() {
    mm_drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
  }
  
  func pullDataFromDBForDay(day: String) {
    if SettingsDBHandler().settingsSaved() != nil {
      self.dataWithDay(ziua: day, disciplina: "", tipul: "")
    }
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 55
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier") as? UITableViewCell
    if cell == nil {
      cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "reuseIdentifier")
    }
    let subj = tableData[indexPath.row]
    cell!.textLabel!.text = subj.disciplina
    for elment in elementsNotInDescription {
      
    }
    var forDetail: NSMutableArray = []
    if !elementsNotInDescription.containsObject("ziua") {
      forDetail.addObject(subj.ziua)
    }
    forDetail.addObject(subj.orele)
    
    if !elementsNotInDescription.containsObject("tipul") {
      forDetail.addObject(subj.tipul)
    }
    forDetail.addObject(subj.formatia)
    if subj.frecventa != " " {
      forDetail.addObject(subj.frecventa)
    }
    forDetail.addObjectsFromArray([subj.sala, subj.cadruDidactic])
    cell!.detailTextLabel!.text = forDetail.componentsJoinedByString(", ")
    return cell!
  }
  
  func dataWithDay(#ziua: String, disciplina: String, tipul: String) {
    if SettingsDBHandler().settingsSaved() != nil {
      tableData = dataHandler.subjectsForFilter(ziua: ziua, disciplina: disciplina, tipul: tipul)
      var forTitle: NSMutableArray = []
      elementsNotInDescription = []
      filters = []
      var grupa: String = SettingsDBHandler().grupa()
      if ziua != "" {
        filters.append(ziua)
        forTitle.addObject(ziua)
        elementsNotInDescription.addObject("ziua")
      }; if tipul != "" {
        filters.append(tipul)
        forTitle.addObject(tipul)
        elementsNotInDescription.addObject("tipul")
      }; if disciplina == ""  && grupa != ""{
        filters.append(grupa)
        forTitle.addObject(grupa.stringByReplacingOccurrencesOfString("Grupa ", withString: "", options: nil, range: nil))
        elementsNotInDescription.addObject("grupa")
      }; if elementsNotInDescription.count == 0 && disciplina != "" {
        forTitle.addObject(disciplina)
        elementsNotInDescription.addObject("disciplina")
      }; if disciplina != "" {
        filters.append(disciplina)
      }
      
      if tableData.count == 0 {
        if missingDataView != nil {
          missingDataView!.removeFromSuperview()
        }
        let orientation: UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        if orientation == UIInterfaceOrientation.Portrait  {
          missingDataView = MissingDataView.viewForNoDataWithFilter(frame: view.frame, filters: filters, landscape: false)
        } else {
          missingDataView = MissingDataView.viewForNoDataWithFilter(frame: view.frame, filters: filters, landscape: true)
        }
        view.addSubview(missingDataView!)
      } else if missingDataView != nil {
        missingDataView!.removeFromSuperview()
        missingDataView = nil
      }
      
      title = forTitle.componentsJoinedByString("-")
      tableView.reloadData()
    }
  }
  
  func pushNavigationControllerToViewController(viewController: UIViewController) {
    self.navigationController!.pushViewController(viewController, animated: true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}