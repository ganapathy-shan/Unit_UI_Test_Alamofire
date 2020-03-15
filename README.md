# Unit_UI_Test_Alamofire
Add Unit tests and UI tests using OHHTTPStubs for simple Alamofire network request


UnitTest:

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
