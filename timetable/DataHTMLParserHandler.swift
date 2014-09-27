//
//  DataHTMLParserHandler.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/6/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class DataHTMLParserHandler: NSObject {
  
  func contentForURL(url: NSURL) -> [String : [Int : [String]]] {
    let htmlContent = NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil)
    var error: NSError?
    var parser = HTMLParser(html: htmlContent, error: &error)
    if error != nil { println(error) }
    var key: String = String()
    var values: [String] = []
    var dictionary: [String : [String]] = Dictionary()
    var htmlBody = parser.body
    
    if let bodyNodes = htmlBody?.findChildrenWithTags(["td","h1"]) {
      for node in bodyNodes {
        if node.tagName == "h1" {
          if !key.isEmpty {
            dictionary[key] = values
            values = []
          }
          key = node.contents
        } else {
          if node.findChildrenWithTags(["a"]).count != 0 {
            let secondNode = node.findChildWithTags(["a"])
            values.append(secondNode!.contents)
          } else {
            values.append(node.contents)
          }
        }
      }
      dictionary[key] = values
    }
    return transformDictionaryData(dictionary)
  }
  
  func transformDictionaryData(dictionary: [String : [String]]) -> [String : [Int : [String]]] {
    var finalDictionary: [String : [Int : [String]]] = Dictionary()
    for key in dictionary.keys.array {
      var tmpDictionary: [Int : [String]] = Dictionary()
      if dictionary[key]!.count != 0 {
        for i in 0..<dictionary[key]!.count/8 {
          tmpDictionary[i] = Array(dictionary[key]![i*8..<(i+1)*8])
        }
        finalDictionary[key] = tmpDictionary
      }
    }
    return finalDictionary
  }
}
