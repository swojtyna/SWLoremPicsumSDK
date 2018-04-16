//
//  PhotoWebServiceTests.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 16.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import XCTest
@testable import SWLoremPicsumSDK

class PhotoWebServiceTests: XCTestCase {

    func testGetPhotoSuccessAndParsePhotoSuccess() {
        // given
        let testExpectation = expectation(description: "Get request photo success and parse photo success")
        let photoRequestMock = PhotoRequestMock(shouldCompletionReturnSuccess: true)
        let photoParserMock = PhotoParserMock(shouldCompletionReturnSuccess: true)
        let photoWebService = PhotoWebService(request: photoRequestMock, parser: photoParserMock)

        // when
        photoWebService.photo(photoId: "1", width: 0, height: 0) { _ in
            // verify
            XCTAssertTrue(photoRequestMock.didCompletionSuccessCalled)
            XCTAssertFalse(photoRequestMock.didCompletionFailureCalled)
            XCTAssertTrue(photoParserMock.didCompletionSuccessCalled)
            XCTAssertFalse(photoParserMock.didCompletionFailureCalled)
            testExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.1)
    }

    func testGetPhotoSuccessAndParsePhotoFail() {
        // given
        let testExpectation = expectation(description: "Get request photo success and parse photo fail")
        let photoRequestMock = PhotoRequestMock(shouldCompletionReturnSuccess: true)
        let photoParserMock = PhotoParserMock(shouldCompletionReturnSuccess: false)
        let photoWebService = PhotoWebService(request: photoRequestMock, parser: photoParserMock)

        // when
        photoWebService.photo(photoId: "1", width: 0, height: 0) { _ in
            // verify
            XCTAssertTrue(photoRequestMock.didCompletionSuccessCalled)
            XCTAssertFalse(photoRequestMock.didCompletionFailureCalled)
            XCTAssertFalse(photoParserMock.didCompletionSuccessCalled)
            XCTAssertTrue(photoParserMock.didCompletionFailureCalled)
            testExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.1)
    }

    func testGetPhotoFailAndParsePhotoFail() {
        // given
        let testExpectation = expectation(description: "Get request photo fail and parse photo fail")
        let photoRequestMock = PhotoRequestMock(shouldCompletionReturnSuccess: false)
        let photoParserMock = PhotoParserMock(shouldCompletionReturnSuccess: false)
        let photoWebService = PhotoWebService(request: photoRequestMock, parser: photoParserMock)

        // when
        photoWebService.photo(photoId: "1", width: 0, height: 0) { _ in
            // verify
            XCTAssertFalse(photoRequestMock.didCompletionSuccessCalled)
            XCTAssertTrue(photoRequestMock.didCompletionFailureCalled)
            XCTAssertFalse(photoParserMock.didCompletionSuccessCalled)
            XCTAssertFalse(photoParserMock.didCompletionFailureCalled)
            testExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.1)
    }

}
