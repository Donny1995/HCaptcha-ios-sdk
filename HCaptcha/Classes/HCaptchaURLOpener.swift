//
//  HCaptchaURLOpener.swift
//  HCaptcha
//
//  Copyright © 2022 HCaptcha. All rights reserved.
//

import Foundation
import UIKit

/**
 * The protocol for a contractor which can handle/open URLs in an external viewer/browser
 */
internal protocol HCaptchaURLOpener {
    /**
     Return true if url can be handled
     - parameter url: The URL to be checked
     */
    func canOpenURL(_ url: URL) -> Bool

    /**
     Handle passed url
     - parameter url: The URL to be checked
     */
    func openURL(_ url: URL)
}

/**
 * UIApplication based implementation
 */
internal class HCapchaAppURLOpener: HCaptchaURLOpener {
    func canOpenURL(_ url: URL) -> Bool {
        guard let application = HCaptcha.applicationReference else {
            return false
        }
        
        return application.canOpenURL(url)
    }

    func openURL(_ url: URL) {
        guard let application = HCaptcha.applicationReference else {
            return
        }
        
        if #available(iOS 10.0, *) {
            application.open(url, options: [:], completionHandler: nil)
        } else {
            application.openURL(url)
        }
    }
}
