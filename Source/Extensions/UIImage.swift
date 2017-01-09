//
//  UIImage.swift
//  Extension for UIImage
//
//  Created by Eugen on 09/01/17.
//  Copyright (c) 2017 Eugen Dimboiu
//

import UIKit

extension UIImage {
  public func rotated(byDegrees degrees: CGFloat) -> UIImage? {
    let degreesToRadians: (CGFloat) -> CGFloat = {
      return $0 / 180.0 * CGFloat(M_PI)
    }

    let rotatedViewContainer = UIView(frame: CGRect(origin: .zero, size: size))
    rotatedViewContainer.transform = CGAffineTransform(rotationAngle: degreesToRadians(degrees))
    let rotatedSize = rotatedViewContainer.frame.size
    
    UIGraphicsBeginImageContext(rotatedSize)
    if let bitmap = UIGraphicsGetCurrentContext() {
      bitmap.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0)
      bitmap.rotate(by: degreesToRadians(degrees))
      bitmap.scaleBy(x: 1.0, y: -1.0)
      bitmap.draw(self.cgImage!, in: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))
    }
    let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return rotatedImage
  }
}