//
//  Extentions.swift
//  S.O.F.E
//
//  Created by Meme Mhd on 13/09/2020.
//  Copyright © 2020 S.O.F.E. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    public var width: CGFloat{
        return self.frame.size.width
    }
    public var height: CGFloat{
        return self.frame.size.height
    }
    public var top: CGFloat{
        return self.frame.origin.y
    }
    public var bottom: CGFloat{
        return self.frame.size.height + self.frame.origin.y
    }
    public var left: CGFloat{
        return self.frame.origin.x
    }
    public var right: CGFloat{
        return self.frame.size.width + self.frame.origin.x
    }

}

class Extentions{
    static func isPasswordViald(_ password: String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{8,}$")
        return passwordTest.evaluate(with: password)
    }
   static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    static func isValidPhone(_ phoneNumber: String) -> Bool {
        let regularExpressionForPhone = "^\\+(?:[0-9]?){6,14}[0-9]$"
        let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
        return testPhone.evaluate(with: phoneNumber)
    }
}
