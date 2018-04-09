//
//  SWLoremPicsumSDKTests.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 02.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import XCTest
@testable import SWLoremPicsumSDK

class SWLoremPicsumSDKTests: XCTestCase {

    func testPhoto() {
        let photoExpectation = expectation(description: "Get photo with success")
        PhotoWebService().photo(photoId: "2", width: 200, height: 300) { result in
            switch result {
            case .success:
                photoExpectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        }

        waitForExpectations(timeout: 1.5)
    }

    func testPhotosList() {
        let photosListExpectation = expectation(description: "Get photos lits with success")
        PhotosListWebService().photosList { result in
            switch result {
            case .success:
                photosListExpectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        }

        waitForExpectations(timeout: 1.5)
    }

}
