//
//  PhotosListParserTests.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 16.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import SWLoremPicsumSDK

class PhotosListParserTests: XCTestCase {

    func testParsePhotosListSuccess() {
        // given
        let filePhotosListPath = "example_list.json"

        guard let filePath = OHPathForFile(filePhotosListPath, type(of: self)),
            let photosListData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
            XCTFail("Can't find file")
            return
        }

        var resultPhotosList: [PhotoElement]?
        var resultError: SWError?

        // when
        PhotosListParser().parse(photosListData) { result in
            switch result {
            case .success(let photosList):
                resultPhotosList = photosList
            case .failure(let error):
                resultError = error
            }
        }

        // verify
        XCTAssertNil(resultError)
        XCTAssertNotNil(resultPhotosList)
    }

    func testParsePhotosListFail() {
        // given
        let photosListData = Data()
        var resultPhotosList: [PhotoElement]?
        var resultError: SWError?

        // when
        PhotosListParser().parse(photosListData) { result in
            switch result {
            case .success(let photosList):
                resultPhotosList = photosList
            case .failure(let error):
                resultError = error
            }
        }

        // verify
        XCTAssertNotNil(resultError)
        XCTAssertNil(resultPhotosList)
    }

}
