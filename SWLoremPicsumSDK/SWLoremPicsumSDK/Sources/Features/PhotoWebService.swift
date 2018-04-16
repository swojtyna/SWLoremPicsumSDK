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

    private let request: PhotoRequestProtocol
    private let parser: PhotoParserProtocol

    public init(request: PhotoRequestProtocol, parser: PhotoParserProtocol) {
        self.request = request
        self.parser = parser
    }

    public convenience init() {
        self.init(request: PhotoRequest(), parser: PhotoParser())
    }

    public func photo(photoId: String, width: Int, height: Int, completion: @escaping PhotoWebServiceCompletion) {
        request.send(photoId: photoId, width: width, height: height) { result in
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
