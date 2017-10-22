//
//  Helper.swift
//  Flourish
//
//  Created by Jason Du on 10/21/17.
//  Copyright © 2017 Jason Du. All rights reserved.
//

import Foundation
import UIKit

enum Theme {
    static let darkBlue = UIColor(red: 0.349, green: 0.561, blue: 0.878, alpha: 1.00)
    static let lightBlue = UIColor(red: 0.416, green: 0.733, blue: 0.847, alpha: 1.00)
}

class GradientNavBar {
    static func create(size: CGRect) -> UIImage {
        let gradient = CAGradientLayer()
        var updatedFrame = size
        updatedFrame.size.height += 20
        gradient.frame = updatedFrame

        gradient.colors = [UIColor(red: 0.349, green: 0.561, blue: 0.878, alpha: 1.00).cgColor, UIColor(red: 0.416, green: 0.733, blue: 0.847, alpha: 1.00).cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.5)

        UIGraphicsBeginImageContext(gradient.frame.size)

        gradient.render(in: UIGraphicsGetCurrentContext()!)

        let outputImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return outputImage!
    }
}

// https://stackoverflow.com/questions/29782982/how-to-input-currency-format-on-a-text-field-from-right-to-left-using-swift
extension String {

    // formatting text for currency textField
    func currencyInputFormatting() -> String {

        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        var amountWithPrefix = self

        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count), withTemplate: "")

        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))

        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }

        return formatter.string(from: number)!
    }
}