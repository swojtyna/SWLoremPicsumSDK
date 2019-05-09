//
//  PhotoRequestTests.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 15.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import SWLoremPicsumSDK

class PhotoRequestTests: XCTestCase {

    func testGetPhotoSuccess200Response() {
        // given
        let testExpectation = expectation(description: "Get photo with success")
        let width = 200
        let height = 300
        let photoId = "2"
        var didStubBlockWasCalled = false
        let urlAbsolutePath = "https://picsum.photos/id/\(photoId)/\(width)/\(height)"

        stub(condition: isAbsoluteURLString(urlAbsolutePath)) { _ in
            guard let filePath = OHPathForFile("photo_200_300_id2.jpg", type(of: self)) else {
                return OHHTTPStubsResponse(error: NSError(domain: "OHHTTPStubsResponse", code: -1, userInfo: ["additionalInfo": "Can't find file"]))
            }

            didStubBlockWasCalled = true
            return OHHTTPStubsResponse(fileAtPath: filePath, statusCode: 200, headers: nil)
        }

        // when
        PhotoRequest().send(photoId: photoId, width: width, height: height) { result in
            switch result {
            case .success:
                XCTAssertTrue(didStubBlockWasCalled)
                testExpectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        }

        // verify
        waitForExpectations(timeout: 0.1)

        OHHTTPStubs.removeAllStubs()
    }

    func testGetPhotoFail500Response() {
        // given
        let testExpectation = expectation(description: "Get photo with fail 500 response")
        let width = 200
        let height = 300
        let photoId = "2"
        var didStubBlockWasCalled = false
        let path = "https://picsum.photos/id/\(photoId)/\(width)/\(height)"

        stub(condition: isAbsoluteURLString(path)) { _ in
            didStubBlockWasCalled = true
            return OHHTTPStubsResponse(error: NSError(domain: "OHHTTPStubsResponse", code: 500, userInfo: nil))
        }

        // when
        PhotoRequest().send(photoId: photoId, width: width, height: height) { result in
            switch result {
            case .success:
                XCTFail("Error: There is the image in response. This test should fail.")
            case .failure:
                XCTAssertTrue(didStubBlockWasCalled)
                testExpectation.fulfill()
            }
        }

        // verify
        waitForExpectations(timeout: 0.1)

        OHHTTPStubs.removeAllStubs()
    }

}
