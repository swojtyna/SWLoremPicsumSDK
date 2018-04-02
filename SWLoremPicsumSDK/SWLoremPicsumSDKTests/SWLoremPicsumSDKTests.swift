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
        PhotoWebService().photo { result in
            switch result {
            case .success(let image):
                print("image \(image)")
                photoExpectation.fulfill()
            case .failure(let error):
                print("⛔️ \(error)")
            }
        }

        waitForExpectations(timeout: 2.5)
    }

    func testPhotosList() {
        let photosListExpectation = expectation(description: "Get photo with success")
        PhotosListWebService().photosList { result in
            switch result {
            case .success(let photoElements):
                print("photoElements count \(photoElements.count)")
                photosListExpectation.fulfill()
            case .failure(let error):
                print("⛔️ \(error)")
            }
        }

        waitForExpectations(timeout: 2.5)
    }

}
