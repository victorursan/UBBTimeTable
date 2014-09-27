//
//  LeftTableViewController.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 8/12/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

protocol LeftTableViewControllerDelegate {
  func pushNavigationControllerToViewController(viewController: UIViewController)
  func dataWithDay(#ziua: String, disciplina: String, tipul: String)
}

class LeftTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SettingsViewControllerDelegate {
  
  var tableView: UITableView!
  var delegate: MainTableViewController
  var dataHandler: DataDBHandler
  
  var valuesForTableView: [String] = ["Home", "Setting"]
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(dataHandler: DataDBHandler, delegate: MainTableViewController) {
    self.dataHandler = dataHandler
    self.delegate = delegate
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = UIColor(red: 0.0039, green: 0.3411, blue: 0.615686, alpha: 1)
    tableView = UITableView(frame: CGRectMake(view.frame.origin.x, 30, 240, view.frame.size.height-30))
    tableView.delegate = self
    tableView.dataSource = self
    view.addSubview(tableView)
  }

  // MARK: - Table view data source
  
  func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier") as? UITableViewCell
    if cell == nil {
      cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "reuseIdentifier")
    }
    cell!.textLabel!.text = valuesForTableView[indexPath.row]
    return cell!
  }
  
  func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    mm_drawerController.closeDrawerAnimated(true, completion: nil)
    if (indexPath.row == 0) {
     self.delegate.dataWithDay(ziua: Date().dayString(), disciplina: "", tipul: "")
    } else if (indexPath.row == 1) {
      var settingsVC = SettingsViewController(dataHandler: self.dataHandler, delegate: self)
      self.delegate.pushNavigationControllerToViewController(settingsVC)
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
  }
  
  func refreshedDataBase() {
    self.delegate.dataWithDay(ziua: "", disciplina: "", tipul: "")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
