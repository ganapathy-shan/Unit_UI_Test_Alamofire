//
//  Alamofire_Simple_ExampleTests.swift
//  Alamofire_Simple_ExampleTests
//
//  Created by Shanmuganathan on 10/03/20.
//  Copyright © 2020 Shanmuganathan. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Alamofire_Simple_Example

class Alamofire_Simple_ExampleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestWith404Response() {
        let completionExpectation = self.expectation(description: "completion")
        stub(condition: isAbsoluteURLString("MyTest")) { (request) -> HTTPStubsResponse in
            return HTTPStubsResponse(data: Data(), statusCode: 404, headers: ["" : ""])
        }
        let service = NetworkServie()
        service.sendRequest(url: URL(string: "MyTest")!) { (response, status) in
            XCTAssertEqual(status, 404)
            completionExpectation.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testRequestWithOtherThan404Response() {
        let completionExpectation = self.expectation(description: "completion")
        stub(condition: isAbsoluteURLString("MyTest200")) { (request) -> HTTPStubsResponse in
            return HTTPStubsResponse(data: Data(), statusCode: 200, headers: ["" : ""])
        }
        let service = NetworkServie()
        service.sendRequest(url: URL(string: "MyTest200")!) { (response, status) in
            XCTAssertNotEqual(status, 404)
            completionExpectation.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }

}
