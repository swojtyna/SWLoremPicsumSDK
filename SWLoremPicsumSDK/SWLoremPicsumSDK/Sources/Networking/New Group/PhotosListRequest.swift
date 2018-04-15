//
//  PhotosListRequest.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 15.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya
import Result

public class PhotosListRequest {

    private let provider: MoyaProvider<PhotosListEndpoint>
    private var cancellable: Cancellable?

    public init() {
        provider = MoyaProvider<PhotosListEndpoint>()
    }

    public func send(completion: @escaping Moya.Completion) {
        provider.request(.photosList, completion: completion)
    }

    public func cancel() {
        cancellable?.cancel()
    }

}
