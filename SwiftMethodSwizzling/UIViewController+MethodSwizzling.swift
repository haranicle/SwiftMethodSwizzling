//
//  UIViewController+MethodSwizzling.swift
//  SwiftMethodSwizzling
//
//  Created by haranicle on 2014/11/14.
//  Copyright (c) 2014年 haranicle. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC.runtime

extension UIViewController {
    func loggingViewDidLoad() {
        println("\(self.dynamicType) viewDidLoad")
    }
    
    class func switchLoggingMethod () {
        let fromMethod = class_getInstanceMethod(UIViewController.self, "viewDidLoad")
        let toMethod = class_getInstanceMethod(UIViewController.self, "loggingViewDidLoad")
        method_exchangeImplementations(fromMethod, toMethod);
    }
}