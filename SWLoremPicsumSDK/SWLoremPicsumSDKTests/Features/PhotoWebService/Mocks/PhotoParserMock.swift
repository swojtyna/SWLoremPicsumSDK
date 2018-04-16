//
//  PhotoParserMock.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 16.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
@testable import SWLoremPicsumSDK

class PhotoParserMock: PhotoParserProtocol {

    var didCompletionSuccessCalled = false
    var didCompletionFailureCalled = false
    private let shouldCompletionReturnSuccess: Bool

    init(shouldCompletionReturnSuccess: Bool) {
        self.shouldCompletionReturnSuccess = shouldCompletionReturnSuccess
    }

    func parse(_ data: Data, completion: PhotoParserCompletion) {
        if shouldCompletionReturnSuccess {
            didCompletionSuccessCalled = true
            completion(.success(UIImage()))
        } else {
            didCompletionFailureCalled = true
            completion(.failure(.parserError(reason: .imageMapping)))
        }
    }

}
