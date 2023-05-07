//
//  ClientError.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum ClientError: LocalizedError {
    /// Failed to build the URL to make the request.
    case malformedURL
    /// Failed to parse the Mastodon's JSON reponse.
    case malformedJSON
    /// Failed to parse Mastodon's model.
    case invalidModel(error: Error)
    /// Generic error.
    case genericError
    /// The Mastodon service returned an error.
    case mastodonError(String)
    
    public var errorDescription: String? {
        switch self {
        case .malformedURL:
            return "Malformed URL"
        case .malformedJSON:
            return "Malformed JSON"
        case .invalidModel(let error):
            return "Invalid Model, \(error)"
        case .genericError:
            return "Generic Error"
        case .mastodonError(let string):
            return string
        }
    }
}
