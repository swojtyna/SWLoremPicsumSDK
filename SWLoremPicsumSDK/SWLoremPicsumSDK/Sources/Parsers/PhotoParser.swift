//
//  PhotoParser.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 06.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation

public typealias PhotoParserCompletion = (_ result: Result<UIImage, SWError>) -> Void

public protocol PhotoParserProtocol {
    func parse(_ data: Data, completion: PhotoParserCompletion)
}

class PhotoParser: PhotoParserProtocol {

    func parse(_ data: Data, completion: PhotoParserCompletion) {
        guard let image = UIImage(data: data) else {
            completion(.failure(.parserError(reason: .imageMapping)))

            return
        }

        completion(.success(image))
    }

}
