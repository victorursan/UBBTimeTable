//
//  Anul.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/5/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class Anul: NSObject {

  var descriere: String = ""
  var link: String = ""
  
  init(descriere: String, link: String) {
    self.descriere = descriere
    self.link = link
    super.init()
  }
  
}
