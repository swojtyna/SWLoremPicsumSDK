//
//  SWError.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 09.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya

public enum SWError: Error {

    public enum WebServiceReason {
        case moyaError(error: MoyaError)
    }

    public enum ParserReason {
        case imageMapping
        case objectMapping
    }

    case webServiceError(reason: WebServiceReason)
    case parserError(reason: ParserReason)
}
