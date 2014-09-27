/*
  Requiers:
  Bridge header to #import <libxml/HTMLtree.h>
  Build Settings -> Other Linker Flags: -lxml2
  Build Settings -> Header Search Paths: $(SDKROOT)/usr/include/libxml2
*/

import Foundation

func ConvXmlCharToString(str: UnsafePointer<xmlChar>) -> String {
  if str != nil {
    return String.fromCString(UnsafePointer<CChar>(str))!
  }
  return ""
}

//HTMLParser
class HTMLParser {
  var _doc: htmlDocPtr = nil
  var rootNode: HTMLNode?
  
  //HTML tag
  var html: HTMLNode? {
    return rootNode?.findChildWithTags(["html"])
  }
  
  // HEAD tag
  var head: HTMLNode? {
    return rootNode?.findChildWithTags(["head"])
  }
  
  // BODY tag
  var body: HTMLNode? {
    return rootNode?.findChildWithTags(["body"])
  }
  
  init(html: String, inout error: NSError?) {
    if html.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0 {
      var cfenc: CFStringEncoding = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)
      var cfencstr: CFStringRef   = CFStringConvertEncodingToIANACharSetName(cfenc)
      var cur: [CChar]? = html.cStringUsingEncoding(NSUTF8StringEncoding)
      var url = ""
      var enc: UnsafePointer = CFStringGetCStringPtr(cfencstr, 0)
      let optionHtml: CInt = 1
      
      if var ucur = cur {
        var temp: [CChar] = ucur
        var aaa = UnsafePointer<CUnsignedChar>(temp)
        _doc = htmlReadDoc(aaa, url, enc, optionHtml)
        rootNode  = HTMLNode(doc: _doc)
      }
    } else {
      error = NSError(domain: "HTMLParserdomain", code: 1, userInfo: nil)
    }
  }
  
  deinit {
    xmlFreeDoc(_doc)
  }
}
