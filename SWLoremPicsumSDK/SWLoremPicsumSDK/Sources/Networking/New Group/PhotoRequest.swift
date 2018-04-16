//
//  PhotoRequest.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 15.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya
import Result

public protocol PhotoRequestProtocol {
    func send(photoId: String, width: Int, height: Int, completion: @escaping Moya.Completion)
    func cancel()
}

public class PhotoRequest: PhotoRequestProtocol {

    private let provider: MoyaProvider<PhotoEndpoint>
    private var cancellable: Cancellable?

    public init() {
        provider = MoyaProvider<PhotoEndpoint>()
    }

    public func send(photoId: String, width: Int, height: Int, completion: @escaping Moya.Completion) {
        provider.request(.photo(photoId: photoId, width: width, height: height), completion: completion)
    }

    public func cancel() {
        cancellable?.cancel()
    }

}
