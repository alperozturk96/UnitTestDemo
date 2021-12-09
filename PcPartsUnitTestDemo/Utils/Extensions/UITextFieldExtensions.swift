//
//  UITextFieldExtensions.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 23.11.2021.
//

import UIKit

extension UITextField {
    /// It checks textField's text and determine actual value. If value is empty or nil it returns true otherwise it returns false
    /// - Returns: It returns bool value according to textField's text.
    func isEmpthyOrNil() -> Bool {
        guard let content = self.text else {
            return true
        }
        
        if content.isEmpty{
            return true
        }
        else
        {
            return false
        }
    }
    
    
    /// This function is guaranteed to return a non-optional value. If textField's text value nil or text length not longer than one it returns empty string.
    /// - Returns: It returns empty string or actual value.
    func value() -> String{
        guard let content = self.text else {
            return ""
        }
        
        if content.count > 0 {
            return content
        }
        else
        {
            return ""
        }
    }
    
}
