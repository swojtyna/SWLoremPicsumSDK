//
//  PhotoWebService.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 02.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya
import Result

public typealias PhotoWebServiceCompletion = (_ result: Result<UIImage, SWError>) -> Void

public class PhotoWebService {

    private let provider: MoyaProvider<PhotoEndpoint>
    private var cancellable: Cancellable?

    public init() {
        provider = MoyaProvider<PhotoEndpoint>()
    }

    public func photo(photoId: String, width: Int, height: Int, completion: @escaping PhotoWebServiceCompletion) {
        cancellable = provider.request(.photo(photoId: photoId, width: width, height: height)) { result in
            switch result {
            case .success(let response):
                PhotoParser().parse(response.data, completion: completion)
            case .failure(let error):
                completion(.failure(.webServiceError(reason: .moyaError(error: error))))
            }
        }

    }

    public func cancel() {
        cancellable?.cancel()
    }

}
