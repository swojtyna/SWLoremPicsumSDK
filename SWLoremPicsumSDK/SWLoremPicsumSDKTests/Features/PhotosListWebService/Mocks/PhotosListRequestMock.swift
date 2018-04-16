//
//  PhotosListRequestMock.swift
//  SWLoremPicsumSDKTests
//
//  Created by Sebastian Wojtyna on 16.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya
@testable import SWLoremPicsumSDK

class PhotosListRequestMock: PhotosListRequestProtocol {

    var didCompletionSuccessCalled = false
    var didCompletionFailureCalled = false
    var didCancelCalled = false
    private let shouldCompletionReturnSuccess: Bool

    init(shouldCompletionReturnSuccess: Bool) {
        self.shouldCompletionReturnSuccess = shouldCompletionReturnSuccess
    }

    func send(completion: @escaping Moya.Completion) {
        if shouldCompletionReturnSuccess {
            didCompletionSuccessCalled = true
            completion(.success(Response(statusCode: 200, data: Data())))
        } else {
            didCompletionFailureCalled = true
            completion(.failure(.statusCode(Response(statusCode: 500, data: Data()))))
        }
    }

    func cancel() {
        didCancelCalled = true
    }
}
