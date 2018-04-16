//
//  PhotoParserTests.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 16.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import SWLoremPicsumSDK

class PhotoParserTests: XCTestCase {

    func testParsePhotoSuccess() {
        // given
        let photoWidth: CGFloat = 200
        let photoHeight: CGFloat = 300
        let filePhotoPath = "photo_200_300_id2.jpg"

        guard let filePath = OHPathForFile(filePhotoPath, type(of: self)),
            let photoData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
            XCTFail("Can't find file")
            return
        }

        var resultImgage: UIImage?
        var resultError: SWError?

        // when
        PhotoParser().parse(photoData) { result in
            switch result {
            case .success(let image):
                resultImgage = image
            case .failure(let error):
                resultError = error
            }
        }

        // verify
        XCTAssertNil(resultError)
        XCTAssertNotNil(resultImgage)
        XCTAssertEqual(resultImgage?.size.width, photoWidth)
        XCTAssertEqual(resultImgage?.size.height, photoHeight)
    }

    func testParsePhotoFail() {
        // given
        let photoData = Data()
        var resultImgage: UIImage?
        var resultError: SWError?

        // when
        PhotoParser().parse(photoData) { result in
            switch result {
            case .success(let image):
                resultImgage = image
            case .failure(let error):
                resultError = error
            }
        }

        // verify
        XCTAssertNotNil(resultError)
        XCTAssertNil(resultImgage)
    }

}
