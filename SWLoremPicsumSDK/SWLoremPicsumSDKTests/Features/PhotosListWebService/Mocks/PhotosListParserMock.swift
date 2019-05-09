//
//  PhotosListParserMock.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 16.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
@testable import SWLoremPicsumSDK

class PhotosListParserMock: PhotosListParserProtocol {

    var didCompletionSuccessCalled = false
    var didCompletionFailureCalled = false
    private let shouldCompletionReturnSuccess: Bool

    init(shouldCompletionReturnSuccess: Bool) {
        self.shouldCompletionReturnSuccess = shouldCompletionReturnSuccess
    }

    func parse(_ data: Data, completion: PhotosListParserCompletion) {
        if shouldCompletionReturnSuccess {
            didCompletionSuccessCalled = true
            completion(.success([]))
        } else {
            didCompletionFailureCalled = true
            completion(.failure(.parserError(reason: .objectMapping(error: NSError(domain: "PhotosListParserMockError", code: -999, userInfo: nil)))))
        }
    }

}
