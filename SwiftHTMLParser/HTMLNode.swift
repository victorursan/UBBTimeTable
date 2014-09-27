//HTMLNode
class HTMLNode {
  enum HTMLNodeType : String {
    case HTMLUnkownNode     = ""
    case HTMLHrefNode       = "href"
    case HTMLTextNode       = "text"
    case HTMLCodeNode       = "code"
    case HTMLSpanNode       = "span"
    case HTMLPNode          = "p"
    case HTMLLiNode         = "li"
    case HTMLUiNode         = "ui"
    case HTMLImageNode      = "image"
    case HTMLOlNode         = "ol"
    case HTMLStrongNode     = "strong"
    case HTMLPreNode        = "pre"
    case HTMLBlockQuoteNode = "blockquote"
  }
  
  var doc: htmlDocPtr
  var node: xmlNode?
  let nodeType: HTMLNodeType = HTMLNodeType.HTMLUnkownNode
  
  var parent: HTMLNode? {
    if let p = self.node?.parent {
      return HTMLNode(doc: self.doc, node: p)
    }
    return nil
  }
  
  var next: HTMLNode? {
    if let n = node?.next {
      if n != nil{
        return HTMLNode(doc: doc, node: n)
      }
    }
    return nil
  }
  
  var child: HTMLNode? {
    if let c = node?.children {
      if c != nil{
        return HTMLNode(doc: doc, node: c)
      }
    }
    return nil
  }
  
  var className: String {
    return getAttributeNamed("class")
  }
  
  var tagName: String {
    if node != nil {
      return ConvXmlCharToString(self.node!.name)
    }
    return ""
  }
  
  var contents: String {
    if node != nil{
      var n = self.node!.children
      if n != nil {
        return ConvXmlCharToString(n.memory.content)
      }
    }
    return ""
  }
  
  init(doc: htmlDocPtr = nil) {
    self.doc = doc
    var node = xmlDocGetRootElement(doc)
    if node != nil {
      self.node = node.memory
    }
  }
  
  init(doc: htmlDocPtr, node: UnsafePointer<xmlNode>) {
    self.doc = doc
    self.node = node.memory
    
    if let type = HTMLNodeType.fromRaw(tagName) {
      nodeType = type
    }
  }
  
  func getAttributeNamed(name: String) -> String {
    for var attr : xmlAttrPtr = node!.properties; attr != nil; attr = attr.memory.next {
      if attr != nil {
        var mem = attr.memory
        
        if name == ConvXmlCharToString(mem.name) {
          return ConvXmlCharToString(mem.children.memory.content)
        }
      }
    }
    return ""
  }
  
  func findChildrenWithTags(tagNames: [String]) -> [HTMLNode] {
    var nodes: [HTMLNode] = []
    
    return findChildrenWithTags(tagNames, node: self.child, retAry: &nodes)
  }
  
  func findChildrenWithTags(tagNames: [String], node: HTMLNode?, inout retAry: [HTMLNode] ) -> [HTMLNode] {
    if node != nil {
      for n in node! {
        if find(tagNames, n.tagName) != nil {
          retAry.append(n)
        }
        
        findChildrenWithTags(tagNames, node: n.child, retAry: &retAry)
      }
    }
    return retAry
  }
  
  func findChildWithTags(tagNames: [String]) -> HTMLNode? {
    return findChildWithTags(tagNames, node: self)
  }
  
  func findChildWithTags(tagNames: [String], node: HTMLNode?) -> HTMLNode? {
    if node == nil {
      return nil
    }
    
    for curNode in node! {
      if find(tagNames, curNode.tagName) != nil{
        return curNode
      }
      
      if let c = curNode.child {
        if let n = findChildWithTags(tagNames, node: c) {
          return n
        }
      }
    }
    return nil
  }
}

extension HTMLNode: SequenceType {
  func generate() -> HTMLNodeGenerator {
    return HTMLNodeGenerator(node: self)
  }
}


//HTMLNodeGenerator
class HTMLNodeGenerator: GeneratorType {
  var node: HTMLNode?
  
  init(node: HTMLNode?) {
    self.node = node
  }
  
  func next() -> HTMLNode? {
    var temp = node?
    node = node?.next
    return temp
  }
}

