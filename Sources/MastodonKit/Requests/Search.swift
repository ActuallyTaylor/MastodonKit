//
//  Search.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

/// `Search` requests.
public enum Search {
    public enum SearchType: String {
        case accounts
        case hashtags
        case statuses
    }

    /// Searches for content.
    ///
    /// - Parameters:
    ///   - query: The search query.
    ///   - resolve: Whether to resolve non-local accounts.
    /// - Returns: Request for `Results`.
    public static func searchV1(query: String, resolve: Bool? = nil) -> Request<ResultsV1> {
        let parameters = [
            Parameter(name: "q", value: query),
            Parameter(name: "resolve", value: resolve.flatMap(trueOrNil))
        ]

        let method = HTTPMethod.get(.parameters(parameters))
        return Request<Results>(path: "/api/v1/search", method: method)
    }
    
    /// Searches for content using the version 2 api.
    ///
    /// - Parameters:
    ///   - query: The search query.
    ///   - resolve: Whether to resolve non-local accounts.
    /// - Returns: Request for `Results`.
    public static func search(query: String, type: SearchType? = nil, range: RequestRange = .default, resolve: Bool? = nil, following: Bool? = nil, accountId: String? = nil, excludeUnreviewed: Bool? = nil) -> Request<Results> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, default: 20)) ?? []
        let localParameters = [
            Parameter(name: "q", value: query),
            Parameter(name: "type", value: type?.rawValue),
            Parameter(name: "resolve", value: resolve.flatMap(trueOrNil)),
            Parameter(name: "following", value: following.flatMap(trueOrNil)),
            Parameter(name: "account_id", value: accountId),
            Parameter(name: "exclude_unreviewed", value: excludeUnreviewed.flatMap(trueOrNil)),
        ]
        
        let method = HTTPMethod.get(.parameters(localParameters + rangeParameters))
        return Request<Results>(path: "/api/v2/search", method: method)
    }
}
