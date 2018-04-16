//
//  PhotosListWebServiceTests.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 16.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import XCTest
@testable import SWLoremPicsumSDK

class PhotosListWebServiceTests: XCTestCase {

    func testGetPhotosListSuccessAndParseListSuccess() {
        // given
        let testExpectation = expectation(description: "Get request photo list success and parse list success")
        let photosListRequestMock = PhotosListRequestMock(shouldCompletionReturnSuccess: true)
        let photosListParserMock = PhotosListParserMock(shouldCompletionReturnSuccess: true)
        let photosListWebService = PhotosListWebService(request: photosListRequestMock, parser: photosListParserMock)

        // when
        photosListWebService.photosList { _ in
            // verify
            XCTAssertTrue(photosListRequestMock.didCompletionSuccessCalled)
            XCTAssertFalse(photosListRequestMock.didCompletionFailureCalled)
            XCTAssertTrue(photosListParserMock.didCompletionSuccessCalled)
            XCTAssertFalse(photosListParserMock.didCompletionFailureCalled)
            testExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.1)
    }

    func testGetPhotosListSuccessAndParseListFail() {
        // given
        let testExpectation = expectation(description: "Get request photo list success and parse list fail")
        let photosListRequestMock = PhotosListRequestMock(shouldCompletionReturnSuccess: true)
        let photosListParserMock = PhotosListParserMock(shouldCompletionReturnSuccess: false)
        let photosListWebService = PhotosListWebService(request: photosListRequestMock, parser: photosListParserMock)

        // when
        photosListWebService.photosList { _ in
            // verify
            XCTAssertTrue(photosListRequestMock.didCompletionSuccessCalled)
            XCTAssertFalse(photosListRequestMock.didCompletionFailureCalled)
            XCTAssertFalse(photosListParserMock.didCompletionSuccessCalled)
            XCTAssertTrue(photosListParserMock.didCompletionFailureCalled)
            testExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.1)
    }

    func testGetPhotosListFailAndParseListFail() {
        // given
        let testExpectation = expectation(description: "Get request photo list fail and parse list fail")
        let photosListRequestMock = PhotosListRequestMock(shouldCompletionReturnSuccess: false)
        let photosListParserMock = PhotosListParserMock(shouldCompletionReturnSuccess: false)
        let photosListWebService = PhotosListWebService(request: photosListRequestMock, parser: photosListParserMock)

        // when
        photosListWebService.photosList { _ in
            // verify
            XCTAssertFalse(photosListRequestMock.didCompletionSuccessCalled)
            XCTAssertTrue(photosListRequestMock.didCompletionFailureCalled)
            XCTAssertFalse(photosListParserMock.didCompletionSuccessCalled)
            XCTAssertFalse(photosListParserMock.didCompletionFailureCalled)
            testExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.1)
    }

}
