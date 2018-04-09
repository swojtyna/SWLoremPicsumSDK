//
//  PhotosListWebService.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 02.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya
import Result

public typealias PhotosListWebServiceCompletion = (_ result: Result<[PhotoElement], SWError>) -> Void

public class PhotosListWebService {

    private let provider: MoyaProvider<PhotosListEndpoint>
    private var cancellable: Cancellable?

    public init() {
        provider = MoyaProvider<PhotosListEndpoint>()
    }

    public func photosList(completion: @escaping PhotosListWebServiceCompletion) {
        cancellable = provider.request(.photosList) { result in
            switch result {
            case .success(let response):
                PhotosListParser().parse(response.data, completion: completion)
            case .failure(let error):
                completion(.failure(.webServiceError(reason: .moyaError(error: error))))
            }
        }
    }

    public func cancel() {
        cancellable?.cancel()
    }

}
