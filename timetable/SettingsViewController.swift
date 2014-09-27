//
//  SettingsViewController.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 8/13/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
  func refreshedDataBase()
}

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
  
  var settings: SettingsHandler
  var dataHandler: DataDBHandler
  var networkReachability = Reachability.reachabilityForInternetConnection()
  var delegate: SettingsViewControllerDelegate
  
  
  var tableView: UITableView!
  var pickerView: UIPickerView!
  var button: UIButton!
  
  var dataInTableView: [String] = ["", "", "", ""]
  var pickerElements: [String] = []
  var editMode: Bool = false
  let sectionArray = ["Studii", "Specializarea", "Anul", "Grupa"]
  let sectionDictionary = ["Studii" : 1, "Specializarea" : 1, "Anul" : 1, "Grupa" : 3]
  var currentIndexPath: NSIndexPath!
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(dataHandler: DataDBHandler, delegate: SettingsViewControllerDelegate) {
    self.dataHandler = dataHandler
    self.delegate = delegate
    settings = SettingsHandler(dataHandler: dataHandler)
    super.init(nibName: nil, bundle: nil)
    self.title = "Settings"
    view.backgroundColor = UIColor.whiteColor()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .Plain, target: self, action: "editButtonPressed")
    initializeTableView()
    initializePickerView()
  }
  
  override func viewWillAppear(animated: Bool) {
    let orientation: UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
    tableView.scrollEnabled = true
    if orientation == UIInterfaceOrientation.Portrait {
      tableView.scrollEnabled = false
    }
    super.viewWillAppear(animated)
  }
  
  override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
    tableView.scrollEnabled = true
    if (fromInterfaceOrientation == UIInterfaceOrientation.LandscapeRight || fromInterfaceOrientation == UIInterfaceOrientation.LandscapeLeft) && !editMode {
      tableView.scrollEnabled = false
    }
    if editMode {
      tableView.selectRowAtIndexPath(currentIndexPath, animated: false, scrollPosition: UITableViewScrollPosition.Top)
    }
    tableView.frame = view.frame
    pickerView.frame = CGRectMake(0, view.frame.height-180, view.frame.width, 180)
    button.frame = CGRectMake(10, 7, view.frame.width-20, 45)
    super.didRotateFromInterfaceOrientation(fromInterfaceOrientation)
  }
  
  func initializeData() {
    if let data = settings.settingsDBHandler.settingsSaved() {
      
      self.settings.setStudiu(data[0])
      self.settings.setSpecializare(data[1])
      self.settings.setAnul(data[2])
      self.settings.setGrupe(data[3])
      
    }
  }
  
  // MARK: - Button
  
  func initializeButton() {
    button = UIButton(frame: CGRectMake(10, 7, view.frame.width-20, 45))
    button.addTarget(self, action: "buttonPressed", forControlEvents: .TouchUpInside)
    button.setTitle("Refresh", forState: UIControlState.Normal)
    button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    button.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
    button.titleLabel!.font = UIFont(name: "Arial", size: 35)
  }
  
  func buttonPressed() {
    networkReachability = Reachability.reachabilityForInternetConnection()
    let networkStatus = networkReachability.currentReachabilityStatus()
    if networkStatus.value == NotReachable.value {
      var alert: UIAlertView = UIAlertView(title: "Warning", message: "No network", delegate: nil, cancelButtonTitle: "ok")
      alert.show()
    } else {
      if button.titleLabel!.text == "Refresh" {
        if let data = settings.settingsDBHandler.settingsSaved() {
          
          MBProgressHUD.showHUDAddedTo(view, animated: true)
          let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC))
          dispatch_after(popTime, dispatch_get_main_queue(), {
            
            self.settings.refreshSettingsData()
            self.delegate.refreshedDataBase()
            
            MBProgressHUD.hideHUDForView(self.view, animated: true)
          })
        } else {
          var alert: UIAlertView = UIAlertView(title: "Warning", message: "No data in the Settings", delegate: nil, cancelButtonTitle: "ok")
          alert.show()
        }
      } else {
        if !settings.areSettingsMissing() {
          
          MBProgressHUD.showHUDAddedTo(view, animated: true)
          let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC))
          dispatch_after(popTime, dispatch_get_main_queue(), {
            
            self.settings.saveSettingsData()
            self.editButtonPressed()
            self.delegate.refreshedDataBase()
            
            MBProgressHUD.hideHUDForView(self.view, animated: true)
          })
        } else {
          var alert: UIAlertView = UIAlertView(title: "Warning", message: "Settings missing", delegate: nil, cancelButtonTitle: "ok")
          alert.show()
        }
      }
    }
  }
  
  func editButtonPressed() {
    networkReachability = Reachability.reachabilityForInternetConnection()
    let networkStatus = networkReachability.currentReachabilityStatus()
    if networkStatus.value == NotReachable.value {
      var alert: UIAlertView = UIAlertView(title: "Warning", message: "No network", delegate: nil, cancelButtonTitle: "ok")
      alert.show()
    } else {
      editMode = !editMode
      tableView.scrollEnabled = true
      if editMode {
        
        MBProgressHUD.showHUDAddedTo(view, animated: true)
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC))
        dispatch_after(popTime, dispatch_get_main_queue(), {
          
          self.pickerElements = self.settings.getStudii()
          if let data = self.settings.settingsDBHandler.settingsSaved() {
            self.dataInTableView = Array(data[0...3])
          }
          self.initializeData()
          self.tableView.allowsSelection = true
          self.currentIndexPath = NSIndexPath(forRow: 0, inSection: 0)
          self.tableView.selectRowAtIndexPath(self.currentIndexPath, animated: true, scrollPosition: UITableViewScrollPosition.None)
          self.tableView(self.tableView, didSelectRowAtIndexPath: self.currentIndexPath)
          self.pickerView.hidden = false
          self.button.setTitle("Save", forState: UIControlState.Normal)
          println("here")
          
          MBProgressHUD.hideHUDForView(self.view, animated: true)
        })
      } else {
        let orientation: UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        if orientation == UIInterfaceOrientation.Portrait {
          tableView.scrollEnabled = false
        }
        
        MBProgressHUD.showHUDAddedTo(view, animated: true)
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC))
        dispatch_after(popTime, dispatch_get_main_queue(), {
          
          self.tableView.reloadData()
          self.tableView.allowsSelection = false
          self.pickerView.hidden = true
          self.button.setTitle("Refresh", forState: UIControlState.Normal)
          
          MBProgressHUD.hideHUDForView(self.view, animated: true)
        })
      }
    }
  }
  
  // MARK: - Table View
  func initializeTableView() {
    initializeButton()
    tableView = UITableView(frame: view.frame)
    tableView.sectionHeaderHeight = 22
    tableView.sectionFooterHeight = 0
    tableView.allowsSelection = false
    tableView.delegate = self
    tableView.dataSource = self
    view.addSubview(tableView)
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 4
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 44
    } else if indexPath.row == 1 {
      return 60
    }
    return 180
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "\(sectionArray[section]):"
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sectionDictionary[sectionArray[section]]!
  }
  
  func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    if indexPath.row == 0 {
      return indexPath
    }
    return nil
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier") as? UITableViewCell
    if cell == nil {
      cell = UITableViewCell(style: UITableViewCellStyle.Default , reuseIdentifier: "reuseIdentifier")
    }
    cell!.textLabel!.text = " "
    if editMode {
      if indexPath.row == 0 {
        cell!.textLabel!.text = dataInTableView[indexPath.section]
      } else if (indexPath.row == 1 && indexPath.section == 3) {
        cell!.addSubview(button)
      }
    } else {
      if let data = settings.settingsDBHandler.settingsSaved() {
        if indexPath.row == 0 {
          cell!.textLabel!.text = data[indexPath.section]
        }
      }
      if (indexPath.row == 1 && indexPath.section == 3) {
        cell!.addSubview(button)
      }
    }
    
    return cell!
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    self.currentIndexPath = indexPath
    switch self.currentIndexPath.section {
    case 0: self.pickerElements = self.settings.getStudii()
    case 1: self.pickerElements = self.settings.getSpecializari()
    case 2: self.pickerElements = self.settings.getAnii()
    case 3: self.pickerElements = self.settings.getGrupe()
    default: ""
    }
    
    var position = 0
    if self.dataInTableView[indexPath.section] != "" {
      position = find(self.pickerElements, self.dataInTableView[indexPath.section])!
    }
    
    if !self.pickerElements.isEmpty {
      let value = self.pickerElements[position]
      let indexPaths = [indexPath]
      self.dataInTableView[indexPath.section] = value
      self.tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.None)
      switch self.currentIndexPath.section {
      case 0: self.settings.setStudiu(value)
      case 1: self.settings.setSpecializare(value)
      case 2: self.settings.setAnul(value)
      case 3: self.settings.setGrupe(value)
      default: ""
      }
    }
    self.pickerView.reloadAllComponents()
    self.pickerView.selectRow(position, inComponent: 0, animated: false)
    
  }
  
  func emptyCellsBelowIndexPath(indexPath: NSIndexPath) {
    for (var i = indexPath.section+1; i < 4; i++) {
      let indexPaths = [NSIndexPath(forRow: 0, inSection: i)]
      dataInTableView[i] = ""
      tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.None)
      switch i {
      case 0: settings.deleteStudiu()
      case 1: settings.deleteSpecializare()
      case 2: settings.deleteAnul()
      case 3: settings.deleteGrupe()
      default: ""
      }
    }
  }
  
  // MARK: - Picker View
  func initializePickerView() {
    pickerView = UIPickerView(frame: CGRectMake(0, view.frame.height-180, view.frame.width, 180))
    pickerView.layer.borderColor = (UIColor.blackColor()).CGColor
    pickerView.layer.borderWidth = 0.5
    pickerView.backgroundColor = .whiteColor()
    pickerView.delegate = self
    pickerView.dataSource = self
    pickerView.hidden = true
    view.addSubview(pickerView)
  }
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerElements.count
  }
  
  func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 44
  }
  
  func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
    var pickerLabel = UILabel(frame: CGRectMake(5, 0, 310, 44))
    pickerLabel.font = UIFont(name: "Helvetica", size: 18)
    pickerLabel.numberOfLines = 2
    pickerLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
    pickerLabel.textAlignment = NSTextAlignment.Center
    pickerLabel.text = pickerElements[row]
    return pickerLabel
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if !pickerElements.isEmpty {
      switch currentIndexPath.section {
      case 0: settings.setStudiu(pickerElements[row])
      case 1: settings.setSpecializare(pickerElements[row])
      case 2: settings.setAnul(pickerElements[row])
      case 3: settings.setGrupe(pickerElements[row])
      default: ""
      }
      if currentIndexPath.row == 0 {
        let indexPaths = [currentIndexPath]
        dataInTableView[currentIndexPath.section] = pickerElements[row]
        tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.None)
      }
    }
    emptyCellsBelowIndexPath(currentIndexPath)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
