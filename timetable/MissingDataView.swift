//
//  MissingDataView.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/13/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class MissingDataView: UIView {
  
  private var currentImageView: UIImageView?
  
  class func viewForNoDataInDBWith(#frame: CGRect, landscape: Bool) -> MissingDataView {
    var noDataView = MissingDataView(frame: frame)
    noDataView.currentImageView = UIImageView(frame: frame)
    noDataView.currentImageView!.image = noDataView.imageForState(nil, landscape: landscape)
    noDataView.currentImageView!.contentMode = UIViewContentMode.ScaleToFill
    noDataView.addSubview(noDataView.currentImageView!)
    return noDataView
  }
  
  class func viewForNoDataWithFilter(#frame: CGRect, filters: [String], landscape: Bool) -> MissingDataView {
    var noDataForFilterView = MissingDataView(frame: frame)
    noDataForFilterView.currentImageView = UIImageView(frame: frame)
    noDataForFilterView.currentImageView!.image = noDataForFilterView.imageForState(filters, landscape: landscape)
    noDataForFilterView.currentImageView!.contentMode = UIViewContentMode.ScaleToFill
    noDataForFilterView.addSubview(noDataForFilterView.currentImageView!)
    return noDataForFilterView
  }
  
  private func imageForState(filters: [String]?, landscape: Bool) -> UIImage {
    if landscape {
      UIGraphicsBeginImageContextWithOptions(CGSizeMake(568, 320), false, 0)
      noDataLandscape(filters)
    } else {
      UIGraphicsBeginImageContextWithOptions(CGSizeMake(320, 568), false, 0)
      noDataPortrait(filters)
    }
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  func noDataPortrait(filters: [String]?) {
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()
    
    //// Color Declarations
    let color = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.000)
    let color2 = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1.000)
    let color3 = UIColor(red: 0.686, green: 0.686, blue: 0.686, alpha: 1.000)
    let color4 = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1.000)
    
    //// Shadow Declarations
    let shadow = UIColor.blackColor().colorWithAlphaComponent(0.09)
    let shadowOffset = CGSizeMake(0.1, 2.1)
    let shadowBlurRadius: CGFloat = 5
    let shadow2 = UIColor.whiteColor()
    
    //// frame Drawing
    let framePath = UIBezierPath(rect: CGRectMake(0, 0, 320, 568))
    color.setFill()
    framePath.fill()
    
    
    //// drawing
    //// Rectangle 2 Drawing
    let rectangle2Path = UIBezierPath(roundedRect: CGRectMake(126, 163, 68, 14), cornerRadius: 5)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
    color2.setFill()
    rectangle2Path.fill()
    
    ////// Rectangle 2 Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, rectangle2Path.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let rectangle2OpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, rectangle2OpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    rectangle2OpaqueShadow.setFill()
    rectangle2Path.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    
    
    //// Rectangle 3 Drawing
    let rectangle3Path = UIBezierPath(roundedRect: CGRectMake(126, 204, 68, 13), cornerRadius: 5)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
    color2.setFill()
    rectangle3Path.fill()
    
    ////// Rectangle 3 Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, rectangle3Path.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let rectangle3OpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, rectangle3OpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    rectangle3OpaqueShadow.setFill()
    rectangle3Path.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    
    
    //// Rectangle 4 Drawing
    let rectangle4Path = UIBezierPath(roundedRect: CGRectMake(126, 183, 68, 14), cornerRadius: 5)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
    color2.setFill()
    rectangle4Path.fill()
    
    ////// Rectangle 4 Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, rectangle4Path.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let rectangle4OpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, rectangle4OpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    rectangle4OpaqueShadow.setFill()
    rectangle4Path.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    
    
    //// Rectangle 5 Drawing
    let rectangle5Path = UIBezierPath(roundedRect: CGRectMake(126, 224, 68, 14), cornerRadius: 5)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
    color2.setFill()
    rectangle5Path.fill()
    
    ////// Rectangle 5 Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, rectangle5Path.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let rectangle5OpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, rectangle5OpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    rectangle5OpaqueShadow.setFill()
    rectangle5Path.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    //// Bezier Drawing
    var bezierPath = UIBezierPath()
    bezierPath.moveToPoint(CGPointMake(211.15, 210.15))
    bezierPath.addLineToPoint(CGPointMake(211.26, 210.17))
    bezierPath.addCurveToPoint(CGPointMake(212.79, 211.64), controlPoint1: CGPointMake(211.97, 210.42), controlPoint2: CGPointMake(212.53, 210.96))
    bezierPath.addCurveToPoint(CGPointMake(213, 214.01), controlPoint1: CGPointMake(213, 212.26), controlPoint2: CGPointMake(213, 212.84))
    bezierPath.addLineToPoint(CGPointMake(213, 253.97))
    bezierPath.addCurveToPoint(CGPointMake(212.82, 256.23), controlPoint1: CGPointMake(213, 255.13), controlPoint2: CGPointMake(213, 255.71))
    bezierPath.addLineToPoint(CGPointMake(212.79, 256.33))
    bezierPath.addCurveToPoint(CGPointMake(211.26, 257.8), controlPoint1: CGPointMake(212.53, 257.02), controlPoint2: CGPointMake(211.97, 257.55))
    bezierPath.addCurveToPoint(CGPointMake(208.78, 258), controlPoint1: CGPointMake(210.61, 258), controlPoint2: CGPointMake(210, 258))
    bezierPath.addLineToPoint(CGPointMake(203.43, 258))
    bezierPath.addLineToPoint(CGPointMake(203.34, 258))
    bezierPath.addLineToPoint(CGPointMake(203.27, 258))
    bezierPath.addLineToPoint(CGPointMake(115.73, 258))
    bezierPath.addLineToPoint(CGPointMake(115.65, 258))
    bezierPath.addLineToPoint(CGPointMake(115.57, 258))
    bezierPath.addLineToPoint(CGPointMake(110.22, 258))
    bezierPath.addCurveToPoint(CGPointMake(107.85, 257.83), controlPoint1: CGPointMake(109, 258), controlPoint2: CGPointMake(108.39, 258))
    bezierPath.addLineToPoint(CGPointMake(107.74, 257.8))
    bezierPath.addCurveToPoint(CGPointMake(106.21, 256.33), controlPoint1: CGPointMake(107.03, 257.55), controlPoint2: CGPointMake(106.47, 257.02))
    bezierPath.addCurveToPoint(CGPointMake(106, 253.97), controlPoint1: CGPointMake(106, 255.71), controlPoint2: CGPointMake(106, 255.13))
    bezierPath.addLineToPoint(CGPointMake(106, 214.01))
    bezierPath.addCurveToPoint(CGPointMake(106.18, 211.74), controlPoint1: CGPointMake(106, 212.84), controlPoint2: CGPointMake(106, 212.26))
    bezierPath.addLineToPoint(CGPointMake(106.21, 211.64))
    bezierPath.addCurveToPoint(CGPointMake(107.74, 210.17), controlPoint1: CGPointMake(106.47, 210.96), controlPoint2: CGPointMake(107.03, 210.42))
    bezierPath.addCurveToPoint(CGPointMake(110.22, 209.97), controlPoint1: CGPointMake(108.39, 209.97), controlPoint2: CGPointMake(109, 209.97))
    bezierPath.addLineToPoint(CGPointMake(115.57, 209.97))
    bezierPath.addCurveToPoint(CGPointMake(117.94, 210.15), controlPoint1: CGPointMake(116.79, 209.97), controlPoint2: CGPointMake(117.39, 209.97))
    bezierPath.addLineToPoint(CGPointMake(118.05, 210.17))
    bezierPath.addCurveToPoint(CGPointMake(119.58, 211.64), controlPoint1: CGPointMake(118.76, 210.42), controlPoint2: CGPointMake(119.32, 210.96))
    bezierPath.addCurveToPoint(CGPointMake(119.79, 214.01), controlPoint1: CGPointMake(119.79, 212.26), controlPoint2: CGPointMake(119.79, 212.84))
    bezierPath.addCurveToPoint(CGPointMake(119.79, 244.28), controlPoint1: CGPointMake(119.79, 214.01), controlPoint2: CGPointMake(119.79, 232.45))
    bezierPath.addLineToPoint(CGPointMake(199.21, 244.28))
    bezierPath.addCurveToPoint(CGPointMake(199.21, 214.01), controlPoint1: CGPointMake(199.21, 232.45), controlPoint2: CGPointMake(199.21, 214.01))
    bezierPath.addCurveToPoint(CGPointMake(199.39, 211.74), controlPoint1: CGPointMake(199.21, 212.84), controlPoint2: CGPointMake(199.21, 212.26))
    bezierPath.addLineToPoint(CGPointMake(199.42, 211.64))
    bezierPath.addCurveToPoint(CGPointMake(200.95, 210.17), controlPoint1: CGPointMake(199.68, 210.96), controlPoint2: CGPointMake(200.24, 210.42))
    bezierPath.addCurveToPoint(CGPointMake(203.43, 209.97), controlPoint1: CGPointMake(201.61, 209.97), controlPoint2: CGPointMake(202.21, 209.97))
    bezierPath.addLineToPoint(CGPointMake(208.78, 209.97))
    bezierPath.addCurveToPoint(CGPointMake(211.15, 210.15), controlPoint1: CGPointMake(210, 209.97), controlPoint2: CGPointMake(210.61, 209.97))
    bezierPath.closePath()
    bezierPath.lineCapStyle = kCGLineCapRound;
    
    bezierPath.lineJoinStyle = kCGLineJoinBevel;
    
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
    color2.setFill()
    bezierPath.fill()
    
    ////// Bezier Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, bezierPath.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let bezierOpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, bezierOpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    bezierOpaqueShadow.setFill()
    bezierPath.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    CGContextRestoreGState(context)
    
    //// No Data Drawing
    let noDataRect: CGRect = CGRectMake(27, 258, 267, 87)
    var noDataTextContent = NSString(string: "No Data")
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
    let noDataStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    noDataStyle.alignment = NSTextAlignment.Center;
    
    let noDataFontAttributes = [NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 50), NSForegroundColorAttributeName: color3, NSParagraphStyleAttributeName: noDataStyle]
    
    noDataTextContent.drawInRect(CGRectOffset(noDataRect, 0, (noDataRect.height - noDataTextContent.boundingRectWithSize(noDataRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: noDataFontAttributes, context: nil).size.height) / 2), withAttributes: noDataFontAttributes);
    
    ////// No Data Text Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, noDataRect)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let noDataOpaqueTextShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, noDataOpaqueTextShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    noDataOpaqueTextShadow.setFill()
    
    let noDataTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    noDataTextStyle.alignment = NSTextAlignment.Center;
    noDataTextStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
    
    noDataTextContent.drawInRect(CGRectOffset(noDataRect, 0, (noDataRect.height - noDataTextContent.boundingRectWithSize(noDataRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: noDataFontAttributes, context: nil).size.height) / 2),
      withAttributes: [NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 50), NSParagraphStyleAttributeName: noDataTextStyle])
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    
    CGContextRestoreGState(context)
    
    
    if let theFilters = filters? {
      //// setText Drawing
      let setTextRect: CGRect = CGRectMake(37, 357, 245, 203)
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
      let setTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      setTextStyle.alignment = NSTextAlignment.Center;
      
      let setTextFontAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: 23), NSForegroundColorAttributeName: color4, NSParagraphStyleAttributeName: setTextStyle]
      
      let filtersArray: NSArray = theFilters
      let filterString = filtersArray.componentsJoinedByString("\n")
      var theText = "For filters:\n \(filterString) "
      
      
      theText.drawInRect(setTextRect, withAttributes: setTextFontAttributes);
      
      ////// setText Text Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, setTextRect)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let setTextOpaqueTextShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, setTextOpaqueTextShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      setTextOpaqueTextShadow.setFill()
      
      let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      textStyle.alignment = NSTextAlignment.Center;
      textStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
      
      theText.drawInRect(setTextRect, withAttributes: [NSFontAttributeName: UIFont(name: "Helvetica", size: 23), NSParagraphStyleAttributeName: textStyle])
      
      CGContextEndTransparencyLayer(context)
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      
      
      CGContextRestoreGState(context)
      
      //// Top Right Arrow Drawing
      CGContextSaveGState(context)
      CGContextTranslateCTM(context, 288.5, 88)
      CGContextRotateCTM(context, -90 * CGFloat(M_PI) / 180)
      
      var topRightArrowPath = UIBezierPath()
      topRightArrowPath.moveToPoint(CGPointMake(0, 0))
      topRightArrowPath.addCurveToPoint(CGPointMake(22.37, 11.48), controlPoint1: CGPointMake(-0, -0), controlPoint2: CGPointMake(22.37, 11.48))
      topRightArrowPath.addLineToPoint(CGPointMake(0.67, 24.06))
      topRightArrowPath.addCurveToPoint(CGPointMake(0.53, 19.03), controlPoint1: CGPointMake(0.67, 24.06), controlPoint2: CGPointMake(0.61, 21.97))
      topRightArrowPath.addCurveToPoint(CGPointMake(13.55, 11.48), controlPoint1: CGPointMake(6.57, 15.53), controlPoint2: CGPointMake(13.55, 11.48))
      topRightArrowPath.addCurveToPoint(CGPointMake(0.13, 4.59), controlPoint1: CGPointMake(13.55, 11.48), controlPoint2: CGPointMake(6.36, 7.79))
      topRightArrowPath.addCurveToPoint(CGPointMake(0, 0), controlPoint1: CGPointMake(0.05, 1.88), controlPoint2: CGPointMake(0, 0))
      topRightArrowPath.addLineToPoint(CGPointMake(0, 0))
      topRightArrowPath.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
      color3.setFill()
      topRightArrowPath.fill()
      
      ////// Top Right Arrow Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, topRightArrowPath.bounds)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let topRightArrowOpaqueShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, topRightArrowOpaqueShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      topRightArrowOpaqueShadow.setFill()
      topRightArrowPath.fill()
      
    } else {
      //// set Faculty Drawing
      let setFacultyRect: CGRect = CGRectMake(37, 357, 245, 90)
      var setFacultyTextContent = NSString(string: "Set your Faculty in: Menu     Settings")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
      let setFacultyStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      setFacultyStyle.alignment = NSTextAlignment.Center;
      
      let setFacultyFontAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: 25), NSForegroundColorAttributeName: color4, NSParagraphStyleAttributeName: setFacultyStyle]
      
      setFacultyTextContent.drawInRect(CGRectOffset(setFacultyRect, 0, (setFacultyRect.height - setFacultyTextContent.boundingRectWithSize(setFacultyRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: setFacultyFontAttributes, context: nil).size.height) / 2), withAttributes: setFacultyFontAttributes);
      
      ////// set Faculty Text Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, setFacultyRect)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let setFacultyOpaqueTextShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, setFacultyOpaqueTextShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      setFacultyOpaqueTextShadow.setFill()
      
      let facultyTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      facultyTextStyle.alignment = NSTextAlignment.Center;
      facultyTextStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
      
      setFacultyTextContent.drawInRect(CGRectOffset(setFacultyRect, 0, (setFacultyRect.height - setFacultyTextContent.boundingRectWithSize(setFacultyRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: setFacultyFontAttributes, context: nil).size.height) / 2),
        withAttributes: [NSFontAttributeName: UIFont(name: "Helvetica", size: 25), NSParagraphStyleAttributeName: facultyTextStyle])
      
      CGContextEndTransparencyLayer(context)
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      CGContextRestoreGState(context)
      
      //// Text Arrow Drawing
      var textArrowPath = UIBezierPath()
      textArrowPath.moveToPoint(CGPointMake(140.94, 408.68))
      textArrowPath.addLineToPoint(CGPointMake(158, 417.9))
      textArrowPath.addLineToPoint(CGPointMake(141.45, 428))
      textArrowPath.addCurveToPoint(CGPointMake(141.34, 423.96), controlPoint1: CGPointMake(141.45, 428), controlPoint2: CGPointMake(141.4, 426.33))
      textArrowPath.addCurveToPoint(CGPointMake(151.27, 417.9), controlPoint1: CGPointMake(145.95, 421.15), controlPoint2: CGPointMake(151.27, 417.9))
      textArrowPath.addCurveToPoint(CGPointMake(141.03, 412.37), controlPoint1: CGPointMake(151.27, 417.9), controlPoint2: CGPointMake(145.79, 414.94))
      textArrowPath.addCurveToPoint(CGPointMake(140.94, 408.68), controlPoint1: CGPointMake(140.98, 410.19), controlPoint2: CGPointMake(140.94, 408.68))
      textArrowPath.addLineToPoint(CGPointMake(140.94, 408.68))
      textArrowPath.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
      color3.setFill()
      textArrowPath.fill()
      
      ////// Text Arrow Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, textArrowPath.bounds)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let textArrowOpaqueShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, textArrowOpaqueShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      textArrowOpaqueShadow.setFill()
      textArrowPath.fill()
      
      CGContextEndTransparencyLayer(context)
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      CGContextRestoreGState(context)
      
      //// Top Left Arrow Drawing
      CGContextSaveGState(context)
      CGContextTranslateCTM(context, 15, 88)
      CGContextRotateCTM(context, -90 * CGFloat(M_PI) / 180)
      
      var topLeftArrowPath = UIBezierPath()
      topLeftArrowPath.moveToPoint(CGPointMake(0, 0))
      topLeftArrowPath.addCurveToPoint(CGPointMake(22.37, 11.48), controlPoint1: CGPointMake(-0, -0), controlPoint2: CGPointMake(22.37, 11.48))
      topLeftArrowPath.addLineToPoint(CGPointMake(0.67, 24.06))
      topLeftArrowPath.addCurveToPoint(CGPointMake(0.53, 19.03), controlPoint1: CGPointMake(0.67, 24.06), controlPoint2: CGPointMake(0.61, 21.97))
      topLeftArrowPath.addCurveToPoint(CGPointMake(13.55, 11.48), controlPoint1: CGPointMake(6.57, 15.53), controlPoint2: CGPointMake(13.55, 11.48))
      topLeftArrowPath.addCurveToPoint(CGPointMake(0.13, 4.59), controlPoint1: CGPointMake(13.55, 11.48), controlPoint2: CGPointMake(6.36, 7.79))
      topLeftArrowPath.addCurveToPoint(CGPointMake(0, 0), controlPoint1: CGPointMake(0.05, 1.88), controlPoint2: CGPointMake(0, 0))
      topLeftArrowPath.addLineToPoint(CGPointMake(0, 0))
      topLeftArrowPath.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow2.CGColor)
      color3.setFill()
      topLeftArrowPath.fill()
      
      ////// Top Left Arrow Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, topLeftArrowPath.bounds)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let topLeftArrowOpaqueShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, topLeftArrowOpaqueShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      topLeftArrowOpaqueShadow.setFill()
      topLeftArrowPath.fill()
      
      
    }
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    CGContextRestoreGState(context)
    CGContextRestoreGState(context)
  }
  
  func noDataLandscape(filters: [String]?) {
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()
    
    //// Color Declarations
    let color = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.000)
    let color2 = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1.000)
    let color3 = UIColor(red: 0.686, green: 0.686, blue: 0.686, alpha: 1.000)
    let color4 = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1.000)
    
    //// Shadow Declarations
    let shadow = UIColor.blackColor().colorWithAlphaComponent(0.09)
    let shadowOffset = CGSizeMake(0.1, 2.1)
    let shadowBlurRadius: CGFloat = 5
    let shadow2 = UIColor.whiteColor()
    let shadow2Offset = CGSizeMake(0.1, 2.1)
    let shadow2BlurRadius: CGFloat = 5
    
    //// Rectangle Drawing
    let rectanglePath = UIBezierPath(rect: CGRectMake(0, 0, 568, 320))
    color.setFill()
    rectanglePath.fill()
    
    
    //// drawing
    //// Rectangle 2 Drawing
    let rectangle2Path = UIBezierPath(roundedRect: CGRectMake(250, 56, 68, 14), cornerRadius: 5)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
    color2.setFill()
    rectangle2Path.fill()
    
    ////// Rectangle 2 Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, rectangle2Path.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let rectangle2OpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, rectangle2OpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    rectangle2OpaqueShadow.setFill()
    rectangle2Path.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    
    
    //// Rectangle 3 Drawing
    let rectangle3Path = UIBezierPath(roundedRect: CGRectMake(250, 97, 68, 13), cornerRadius: 5)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
    color2.setFill()
    rectangle3Path.fill()
    
    ////// Rectangle 3 Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, rectangle3Path.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let rectangle3OpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, rectangle3OpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    rectangle3OpaqueShadow.setFill()
    rectangle3Path.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    
    
    //// Rectangle 4 Drawing
    let rectangle4Path = UIBezierPath(roundedRect: CGRectMake(250, 76, 68, 14), cornerRadius: 5)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
    color2.setFill()
    rectangle4Path.fill()
    
    ////// Rectangle 4 Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, rectangle4Path.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let rectangle4OpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, rectangle4OpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    rectangle4OpaqueShadow.setFill()
    rectangle4Path.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    
    
    //// Rectangle 5 Drawing
    let rectangle5Path = UIBezierPath(roundedRect: CGRectMake(250, 117, 68, 14), cornerRadius: 5)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
    color2.setFill()
    rectangle5Path.fill()
    
    ////// Rectangle 5 Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, rectangle5Path.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let rectangle5OpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, rectangle5OpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    rectangle5OpaqueShadow.setFill()
    rectangle5Path.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    
    
    //// Bezier Drawing
    var bezierPath = UIBezierPath()
    bezierPath.moveToPoint(CGPointMake(335.15, 103.15))
    bezierPath.addLineToPoint(CGPointMake(335.26, 103.17))
    bezierPath.addCurveToPoint(CGPointMake(336.79, 104.64), controlPoint1: CGPointMake(335.97, 103.42), controlPoint2: CGPointMake(336.53, 103.96))
    bezierPath.addCurveToPoint(CGPointMake(337, 107.01), controlPoint1: CGPointMake(337, 105.26), controlPoint2: CGPointMake(337, 105.84))
    bezierPath.addLineToPoint(CGPointMake(337, 146.97))
    bezierPath.addCurveToPoint(CGPointMake(336.82, 149.23), controlPoint1: CGPointMake(337, 148.13), controlPoint2: CGPointMake(337, 148.71))
    bezierPath.addLineToPoint(CGPointMake(336.79, 149.33))
    bezierPath.addCurveToPoint(CGPointMake(335.26, 150.8), controlPoint1: CGPointMake(336.53, 150.02), controlPoint2: CGPointMake(335.97, 150.55))
    bezierPath.addCurveToPoint(CGPointMake(332.78, 151), controlPoint1: CGPointMake(334.61, 151), controlPoint2: CGPointMake(334, 151))
    bezierPath.addLineToPoint(CGPointMake(327.43, 151))
    bezierPath.addLineToPoint(CGPointMake(327.34, 151))
    bezierPath.addLineToPoint(CGPointMake(327.27, 151))
    bezierPath.addLineToPoint(CGPointMake(239.73, 151))
    bezierPath.addLineToPoint(CGPointMake(239.65, 151))
    bezierPath.addLineToPoint(CGPointMake(239.57, 151))
    bezierPath.addLineToPoint(CGPointMake(234.22, 151))
    bezierPath.addCurveToPoint(CGPointMake(231.85, 150.83), controlPoint1: CGPointMake(233, 151), controlPoint2: CGPointMake(232.39, 151))
    bezierPath.addLineToPoint(CGPointMake(231.74, 150.8))
    bezierPath.addCurveToPoint(CGPointMake(230.21, 149.33), controlPoint1: CGPointMake(231.03, 150.55), controlPoint2: CGPointMake(230.47, 150.02))
    bezierPath.addCurveToPoint(CGPointMake(230, 146.97), controlPoint1: CGPointMake(230, 148.71), controlPoint2: CGPointMake(230, 148.13))
    bezierPath.addLineToPoint(CGPointMake(230, 107.01))
    bezierPath.addCurveToPoint(CGPointMake(230.18, 104.74), controlPoint1: CGPointMake(230, 105.84), controlPoint2: CGPointMake(230, 105.26))
    bezierPath.addLineToPoint(CGPointMake(230.21, 104.64))
    bezierPath.addCurveToPoint(CGPointMake(231.74, 103.17), controlPoint1: CGPointMake(230.47, 103.96), controlPoint2: CGPointMake(231.03, 103.42))
    bezierPath.addCurveToPoint(CGPointMake(234.22, 102.97), controlPoint1: CGPointMake(232.39, 102.97), controlPoint2: CGPointMake(233, 102.97))
    bezierPath.addLineToPoint(CGPointMake(239.57, 102.97))
    bezierPath.addCurveToPoint(CGPointMake(241.94, 103.15), controlPoint1: CGPointMake(240.79, 102.97), controlPoint2: CGPointMake(241.39, 102.97))
    bezierPath.addLineToPoint(CGPointMake(242.05, 103.17))
    bezierPath.addCurveToPoint(CGPointMake(243.58, 104.64), controlPoint1: CGPointMake(242.76, 103.42), controlPoint2: CGPointMake(243.32, 103.96))
    bezierPath.addCurveToPoint(CGPointMake(243.79, 107.01), controlPoint1: CGPointMake(243.79, 105.26), controlPoint2: CGPointMake(243.79, 105.84))
    bezierPath.addCurveToPoint(CGPointMake(243.79, 137.28), controlPoint1: CGPointMake(243.79, 107.01), controlPoint2: CGPointMake(243.79, 125.45))
    bezierPath.addLineToPoint(CGPointMake(323.21, 137.28))
    bezierPath.addCurveToPoint(CGPointMake(323.21, 107.01), controlPoint1: CGPointMake(323.21, 125.45), controlPoint2: CGPointMake(323.21, 107.01))
    bezierPath.addCurveToPoint(CGPointMake(323.39, 104.74), controlPoint1: CGPointMake(323.21, 105.84), controlPoint2: CGPointMake(323.21, 105.26))
    bezierPath.addLineToPoint(CGPointMake(323.42, 104.64))
    bezierPath.addCurveToPoint(CGPointMake(324.95, 103.17), controlPoint1: CGPointMake(323.68, 103.96), controlPoint2: CGPointMake(324.24, 103.42))
    bezierPath.addCurveToPoint(CGPointMake(327.43, 102.97), controlPoint1: CGPointMake(325.61, 102.97), controlPoint2: CGPointMake(326.21, 102.97))
    bezierPath.addLineToPoint(CGPointMake(332.78, 102.97))
    bezierPath.addCurveToPoint(CGPointMake(335.15, 103.15), controlPoint1: CGPointMake(334, 102.97), controlPoint2: CGPointMake(334.61, 102.97))
    bezierPath.closePath()
    bezierPath.lineCapStyle = kCGLineCapRound;
    
    bezierPath.lineJoinStyle = kCGLineJoinBevel;
    
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
    color2.setFill()
    bezierPath.fill()
    
    ////// Bezier Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, bezierPath.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let bezierOpaqueShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, bezierOpaqueShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    bezierOpaqueShadow.setFill()
    bezierPath.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    
    
    
    
    //// No Data Drawing
    let noDataRect: CGRect = CGRectMake(151, 151, 267, 87)
    var noDataTextContent = NSString(string: "No Data")
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
    let noDataStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    noDataStyle.alignment = NSTextAlignment.Center;
    
    let noDataFontAttributes = [NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 50), NSForegroundColorAttributeName: color3, NSParagraphStyleAttributeName: noDataStyle]
    
    noDataTextContent.drawInRect(CGRectOffset(noDataRect, 0, (noDataRect.height - noDataTextContent.boundingRectWithSize(noDataRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: noDataFontAttributes, context: nil).size.height) / 2), withAttributes: noDataFontAttributes);
    
    ////// No Data Text Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, noDataRect)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let noDataOpaqueTextShadow = shadow.colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, noDataOpaqueTextShadow.CGColor)
    CGContextSetBlendMode(context, kCGBlendModeSourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    noDataOpaqueTextShadow.setFill()
    
    
    let noDataTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    noDataTextStyle.alignment = NSTextAlignment.Center;
    noDataTextStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
    
    noDataTextContent.drawInRect(CGRectOffset(noDataRect, 0, (noDataRect.height - noDataTextContent.boundingRectWithSize(noDataRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: noDataFontAttributes, context: nil).size.height) / 2),
      withAttributes: [NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 50), NSParagraphStyleAttributeName: noDataTextStyle])
    
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    
    CGContextRestoreGState(context)
    
    if let theFilters = filters {
      
      //// setText Drawing
      let setTextRect: CGRect = CGRectMake(40, 221, 488, 82)
      
      let filterArray = NSArray(array: theFilters)
      let stringFilters = filterArray.componentsJoinedByString(" - ")
      var setTextTextContent =  "For filters: \(stringFilters)"
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
      let setTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      setTextStyle.alignment = NSTextAlignment.Center;
      
      let setTextFontAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: 22), NSForegroundColorAttributeName: color4, NSParagraphStyleAttributeName: setTextStyle]
      
      setTextTextContent.drawInRect(CGRectOffset(setTextRect, 0, (setTextRect.height - setTextTextContent.boundingRectWithSize(setTextRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: setTextFontAttributes, context: nil).size.height) / 2), withAttributes: setTextFontAttributes);
      
      ////// setText Text Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, setTextRect)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let setTextOpaqueTextShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, setTextOpaqueTextShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      setTextOpaqueTextShadow.setFill()
      
      let setTextTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      setTextTextStyle.alignment = NSTextAlignment.Center;
      setTextTextStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
      
      setTextTextContent.drawInRect(CGRectOffset(setTextRect, 0, (setTextRect.height - setTextTextContent.boundingRectWithSize(setTextRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: setTextFontAttributes, context: nil).size.height) / 2),
        withAttributes: [NSFontAttributeName: UIFont(name: "Helvetica", size: 22), NSParagraphStyleAttributeName: setTextTextStyle])
      
      CGContextEndTransparencyLayer(context)
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      CGContextRestoreGState(context)
      
      //// Top Right Arrow Drawing
      CGContextSaveGState(context)
      CGContextTranslateCTM(context, 529.5, 55)
      CGContextRotateCTM(context, -90 * CGFloat(M_PI) / 180)
      
      var topRightArrowPath = UIBezierPath()
      topRightArrowPath.moveToPoint(CGPointMake(0, 0))
      topRightArrowPath.addCurveToPoint(CGPointMake(22.37, 11.48), controlPoint1: CGPointMake(-0, -0), controlPoint2: CGPointMake(22.37, 11.48))
      topRightArrowPath.addLineToPoint(CGPointMake(0.67, 24.06))
      topRightArrowPath.addCurveToPoint(CGPointMake(0.53, 19.03), controlPoint1: CGPointMake(0.67, 24.06), controlPoint2: CGPointMake(0.61, 21.97))
      topRightArrowPath.addCurveToPoint(CGPointMake(13.55, 11.48), controlPoint1: CGPointMake(6.57, 15.53), controlPoint2: CGPointMake(13.55, 11.48))
      topRightArrowPath.addCurveToPoint(CGPointMake(0.13, 4.59), controlPoint1: CGPointMake(13.55, 11.48), controlPoint2: CGPointMake(6.36, 7.79))
      topRightArrowPath.addCurveToPoint(CGPointMake(0, 0), controlPoint1: CGPointMake(0.05, 1.88), controlPoint2: CGPointMake(0, 0))
      topRightArrowPath.addLineToPoint(CGPointMake(0, 0))
      topRightArrowPath.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
      color3.setFill()
      topRightArrowPath.fill()
      
      ////// Top Right Arrow Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, topRightArrowPath.bounds)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let topRightArrowOpaqueShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, topRightArrowOpaqueShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      topRightArrowOpaqueShadow.setFill()
      topRightArrowPath.fill()
      
      CGContextEndTransparencyLayer(context)
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      
      CGContextRestoreGState(context)
      
      
      CGContextRestoreGState(context)
      
      
    } else {
      
      //// setText Drawing
      let setTextRect: CGRect = CGRectMake(40, 221, 488, 82)
      var setTextTextContent = NSString(string: "Set your Faculty in: Menu     Settings")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
      let setTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      setTextStyle.alignment = NSTextAlignment.Center;
      
      let setTextFontAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: 22), NSForegroundColorAttributeName: color4, NSParagraphStyleAttributeName: setTextStyle]
      
      setTextTextContent.drawInRect(CGRectOffset(setTextRect, 0, (setTextRect.height - setTextTextContent.boundingRectWithSize(setTextRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: setTextFontAttributes, context: nil).size.height) / 2), withAttributes: setTextFontAttributes);
      
      ////// setText Text Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, setTextRect)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let setTextOpaqueTextShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, setTextOpaqueTextShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      setTextOpaqueTextShadow.setFill()
      
      let setTextTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      setTextTextStyle.alignment = NSTextAlignment.Center;
      setTextTextStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
      
      setTextTextContent.drawInRect(CGRectOffset(setTextRect, 0, (setTextRect.height - setTextTextContent.boundingRectWithSize(setTextRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: setTextFontAttributes, context: nil).size.height) / 2),
        withAttributes: [NSFontAttributeName: UIFont(name: "Helvetica", size: 22), NSParagraphStyleAttributeName: setTextTextStyle])
      
      CGContextEndTransparencyLayer(context)
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      
      
      CGContextRestoreGState(context)
      
      
      
      //// Top Left Arrow Drawing
      CGContextSaveGState(context)
      CGContextTranslateCTM(context, 15, 54.5)
      CGContextRotateCTM(context, -90 * CGFloat(M_PI) / 180)
      
      var topLeftArrowPath = UIBezierPath()
      topLeftArrowPath.moveToPoint(CGPointMake(0, 0))
      topLeftArrowPath.addCurveToPoint(CGPointMake(22.37, 11.48), controlPoint1: CGPointMake(-0, -0), controlPoint2: CGPointMake(22.37, 11.48))
      topLeftArrowPath.addLineToPoint(CGPointMake(0.67, 24.06))
      topLeftArrowPath.addCurveToPoint(CGPointMake(0.53, 19.03), controlPoint1: CGPointMake(0.67, 24.06), controlPoint2: CGPointMake(0.61, 21.97))
      topLeftArrowPath.addCurveToPoint(CGPointMake(13.55, 11.48), controlPoint1: CGPointMake(6.57, 15.53), controlPoint2: CGPointMake(13.55, 11.48))
      topLeftArrowPath.addCurveToPoint(CGPointMake(0.13, 4.59), controlPoint1: CGPointMake(13.55, 11.48), controlPoint2: CGPointMake(6.36, 7.79))
      topLeftArrowPath.addCurveToPoint(CGPointMake(0, 0), controlPoint1: CGPointMake(0.05, 1.88), controlPoint2: CGPointMake(0, 0))
      topLeftArrowPath.addLineToPoint(CGPointMake(0, 0))
      topLeftArrowPath.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
      color3.setFill()
      topLeftArrowPath.fill()
      
      ////// Top Left Arrow Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, topLeftArrowPath.bounds)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let topLeftArrowOpaqueShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, topLeftArrowOpaqueShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      topLeftArrowOpaqueShadow.setFill()
      topLeftArrowPath.fill()
      
      CGContextEndTransparencyLayer(context)
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      
      CGContextRestoreGState(context)
      
      
      CGContextRestoreGState(context)
      
      
      //// Top Right Arrow 2 Drawing
      var topRightArrow2Path = UIBezierPath()
      topRightArrow2Path.moveToPoint(CGPointMake(358.5, 254.5))
      topRightArrow2Path.addLineToPoint(CGPointMake(374.87, 263.12))
      topRightArrow2Path.addLineToPoint(CGPointMake(358.99, 272.56))
      topRightArrow2Path.addCurveToPoint(CGPointMake(358.89, 268.79), controlPoint1: CGPointMake(358.99, 272.56), controlPoint2: CGPointMake(358.95, 270.99))
      topRightArrow2Path.addCurveToPoint(CGPointMake(368.42, 263.12), controlPoint1: CGPointMake(363.31, 266.16), controlPoint2: CGPointMake(368.42, 263.12))
      topRightArrow2Path.addCurveToPoint(CGPointMake(358.59, 257.95), controlPoint1: CGPointMake(368.42, 263.12), controlPoint2: CGPointMake(363.15, 260.35))
      topRightArrow2Path.addCurveToPoint(CGPointMake(358.5, 254.5), controlPoint1: CGPointMake(358.54, 255.91), controlPoint2: CGPointMake(358.5, 254.5))
      topRightArrow2Path.addLineToPoint(CGPointMake(358.5, 254.5))
      topRightArrow2Path.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor)
      color3.setFill()
      topRightArrow2Path.fill()
      
      ////// Top Right Arrow 2 Inner Shadow
      CGContextSaveGState(context)
      CGContextClipToRect(context, topRightArrow2Path.bounds)
      CGContextSetShadow(context, CGSizeMake(0, 0), 0)
      CGContextSetAlpha(context, CGColorGetAlpha(shadow.CGColor))
      CGContextBeginTransparencyLayer(context, nil)
      let topRightArrow2OpaqueShadow = shadow.colorWithAlphaComponent(1)
      CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, topRightArrow2OpaqueShadow.CGColor)
      CGContextSetBlendMode(context, kCGBlendModeSourceOut)
      CGContextBeginTransparencyLayer(context, nil)
      
      topRightArrow2OpaqueShadow.setFill()
      topRightArrow2Path.fill()
      
      CGContextEndTransparencyLayer(context)
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      
      CGContextRestoreGState(context)
    }
    
  }
}