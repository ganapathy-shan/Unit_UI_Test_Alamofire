//
//  AppDelegate.swift
//  Alamofire_Simple_Example
//
//  Created by Shanmuganathan on 10/03/20.
//  Copyright © 2020 Shanmuganathan. All rights reserved.
//

import UIKit
import OHHTTPStubs

let urlToRequest = "https://GetStatusCode.com/404"
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        if (ProcessInfo.processInfo.arguments.contains("Testing")) {
            self.stubTestArgumentsForNetworkRequests()
        }
        #endif
        return true
    }
    
    #if DEBUG
    func stubTestArgumentsForNetworkRequests()
    {
        let defaults = UserDefaults.standard
        let statusCode = defaults.integer(forKey: "StatusCode")
        stub(condition: isAbsoluteURLString(urlToRequest)) { (request) -> HTTPStubsResponse in
            return HTTPStubsResponse(data: Data(), statusCode: Int32(statusCode), headers: ["" : ""])
        }
    }
    #endif
}

