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

    private let request: PhotosListRequestProtocol
    private let parser: PhotosListParserProtocol

    public init(request: PhotosListRequestProtocol, parser: PhotosListParserProtocol) {
        self.request = request
        self.parser = parser
    }

    public convenience init() {
        self.init(request: PhotosListRequest(), parser: PhotosListParser())
    }

    public func photosList(completion: @escaping PhotosListWebServiceCompletion) {
        request.send { result in
            switch result {
            case .success(let response):
                self.parser.parse(response.data, completion: completion)
            case .failure(let error):
                completion(.failure(.webServiceError(reason: .moyaError(error: error))))
            }
        }
    }

    public func cancel() {
        request.cancel()
    }

}
