//
//  UITextField+Placeholder.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

extension UITextField {
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            var attributes = self.attributedPlaceholder?.attributes(at: 0, effectiveRange: nil) ?? [:]
            attributes[.foregroundColor] = newValue!
            let placeholder = self.placeholder != nil ? self.placeholder! : ""
            self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                            attributes: attributes)
        }
    }

   var placeHolderFont: UIFont? {
        get {
            return self.placeHolderFont
        }
        set {
            var attributes = self.attributedPlaceholder?.attributes(at: 0,
                                                                    effectiveRange: nil) ?? [:]
            attributes[.font] = newValue!
            let placeholder = self.placeholder != nil ? self.placeholder! : ""
            self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                            attributes: attributes)
        }
    }
}
