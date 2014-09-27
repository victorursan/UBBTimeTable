//
//  URLMaker.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/8/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class URLMaker: NSObject {
  
  func stringForYear() -> String {
    let date = Date()
    let year = date.yearInt()
    let month = date.monthInt()
    var string: String
    if (month >= 2 && month < 10) {
      string = "\(year - 1)-2"
    } else {
      string = "\(year)-1"
    }
    return string
  }
  
  func urlForData(dataLink: String) -> NSURL {
    return NSURL.URLWithString("http://www.cs.ubbcluj.ro/files/orar/\(stringForYear())/tabelar/\(dataLink)")
  }
  
  func urlForYear() -> NSURL {
    return NSURL.URLWithString("http://www.cs.ubbcluj.ro/files/orar/\(stringForYear())/tabelar/index.html")
  }
  
}
