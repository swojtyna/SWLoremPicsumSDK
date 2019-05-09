//
//  PhotoListRequestTests.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 16.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import SWLoremPicsumSDK

class PhotosListRequestTests: XCTestCase {

    func testGetPhotosListSuccess200Response() {
        // given
        let testExpectation = expectation(description: "Get photos list with success")
        var didStubBlockWasCalled = false
        let urlAbsolutePath = "https://picsum.photos/v2/list"

        stub(condition: isAbsoluteURLString(urlAbsolutePath)) { _ in
            guard let filePath = OHPathForFile("example_list.json", type(of: self)) else {
                return OHHTTPStubsResponse(error: NSError(domain: "OHHTTPStubsResponse", code: -1, userInfo: ["additionalInfo": "Can't find file"]))
            }

            didStubBlockWasCalled = true
            return OHHTTPStubsResponse(fileAtPath: filePath, statusCode: 200, headers: nil)
        }

        // when
        PhotosListRequest().send(completion: { result in
            switch result {
            case .success:
                XCTAssertTrue(didStubBlockWasCalled)
                testExpectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error)")
            }

        })

        // verify
        waitForExpectations(timeout: 0.1)

        OHHTTPStubs.removeAllStubs()
    }

    func testGetPhotosListFail500Response() {
        // given
        let testExpectation = expectation(description: "Get photos list with fail 500 response")
        var didStubBlockWasCalled = false
        let path = "https://picsum.photos/v2/list"

        stub(condition: isAbsoluteURLString(path)) { _ in
            didStubBlockWasCalled = true
            return OHHTTPStubsResponse(error: NSError(domain: "OHHTTPStubsResponse", code: 500, userInfo: nil))
        }

        // when
        PhotosListRequest().send(completion: { result in
            switch result {
            case .success:
                XCTFail("Error: There is the json in the response. This test should fail.")
            case .failure:
                XCTAssertTrue(didStubBlockWasCalled)
                testExpectation.fulfill()
            }

        })

        // verify
        waitForExpectations(timeout: 0.1)

        OHHTTPStubs.removeAllStubs()
    }

}
