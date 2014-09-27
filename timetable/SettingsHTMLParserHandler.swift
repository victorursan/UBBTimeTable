//
//  SettingsHTMLParserHandler.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/3/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class SettingsHTMLParserHandler: NSObject {
  
  func contentForURL(url: NSURL) -> [String : [String : [Anul]]] {
    let htmlContent = NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil)
    var error: NSError?
    var parser = HTMLParser(html: htmlContent, error: &error)
    if error != nil { println(error) }
    var key: String = String()
    var values: [Anul] = []
    var dictionary: [String : [Anul]] = Dictionary()
    var htmlBody = parser.body
    if let bodyNodes = htmlBody?.findChildrenWithTags(["th","td"]) {
      for node in bodyNodes {
        if node.tagName == "th" {
          if node.contents != "Anul" {
            key = node.contents
            values = []
          }
          continue
        } else {
          if node.findChildrenWithTags(["a"]).count != 0 {
            let secondNode = node.findChildWithTags(["a"])
            values.append(Anul(descriere: secondNode!.contents, link: secondNode!.getAttributeNamed("href")))
          } else {
            values.append(Anul(descriere: node.contents, link: ""))
          }
        }
        dictionary[key] = values
      }
    }
    return transformDictionaryData(dictionary)
  }
  
  func transformDictionaryData(dictionary: [String : [Anul]]) -> [String : [String : [Anul]]] {
    var finalDictionary: [String : [String : [Anul]]] = Dictionary()
    for key in dictionary.keys.array {
      var tmpDictionary: [String : [Anul]] = Dictionary()
      if key.rangeOfString("Licenta") != nil{
        for i in 0..<dictionary[key]!.count/5 {
          tmpDictionary[dictionary[key]![i*5].descriere] = Array(dictionary[key]![i*5+1..<(i+1)*5]).filter( {$0.descriere != " "})
        }
        finalDictionary["Licenta"] = tmpDictionary
      } else if key.rangeOfString("Master") != nil{
        for i in 0..<dictionary[key]!.count/3 {
          tmpDictionary[dictionary[key]![i*3].descriere] = Array(dictionary[key]![i*3+1..<(i+1)*3]).filter( {$0.descriere != " "})
        }
        finalDictionary["Master"] = tmpDictionary
      }
    }
    return finalDictionary
  }
  
  func groupsForURL(url: NSURL) -> [String] {
    let htmlContent = NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil)
    var error: NSError?
    var parser = HTMLParser(html: htmlContent, error: &error)
    if error != nil { println(error) }
    var htmlBody = parser.body
    var values: [String] = []
    if let bodyNodes = htmlBody?.findChildrenWithTags(["h1"]) {
      for node in bodyNodes[1..<bodyNodes.count] {
        values.append(node.contents)
      }
    }
    return values
  }
  
}
