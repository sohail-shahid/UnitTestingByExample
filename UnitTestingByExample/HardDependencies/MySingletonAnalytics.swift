//
//  MySingletonAnalytics.swift
//  UnitTestingByExample
//
//  Created by SOHAIL KHAN on 28/05/2023.
//

import Foundation

class MySingletonAnalytics {
    private static let instance = MySingletonAnalytics()
    #if DEBUG
        static var stubbedInstance: MySingletonAnalytics?
    #endif
    static var shared: MySingletonAnalytics {
    #if DEBUG
        if let stubbedInstance = stubbedInstance {
            debugPrint(">> MySingletonAnalytics stubbedInstance")
            return stubbedInstance
        }
    #endif
        debugPrint(">> MySingletonAnalytics instance")
        return instance
    }
    func track(event: String) {
        Analytics.shared.track(event: event)
        if self !== MySingletonAnalytics.instance {
            debugPrint(">> Not the MySingletonAnalytics singleton")
        }
    }
}
