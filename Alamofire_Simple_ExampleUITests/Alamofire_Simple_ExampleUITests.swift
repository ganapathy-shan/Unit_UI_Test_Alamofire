//
//  Alamofire_Simple_ExampleUITests.swift
//  Alamofire_Simple_ExampleUITests
//
//  Created by Shanmuganathan on 10/03/20.
//  Copyright © 2020 Shanmuganathan. All rights reserved.
//

import XCTest

class Alamofire_Simple_ExampleUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
    }

    func test404AlertPresent() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments = [ "Testing" ]
        app.launchArguments.append(contentsOf: ["-StatusCode", "404"])
        app.launch()
        app.buttons["SendRequestButton"].tap()
        if !app.alerts.buttons["Dismiss"].waitForExistence(timeout: 5)
        {
            app.alerts.buttons["Dismiss"].tap()
        }
    }
    
    func test404AlertAbsent() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments = [ "Testing" ]
        app.launchArguments.append(contentsOf: ["-StatusCode", "500"])
        app.launch()
        app.buttons["SendRequestButton"].tap()
        if app.alerts.buttons["Dismiss"].waitForExistence(timeout: 5)
        {
            XCTFail()
        }
    }

}
