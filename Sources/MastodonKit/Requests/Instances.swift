//
//  Instances.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

/// `Instances` requests.
public enum Instances {
    /// Gets instance information.
    ///
    /// - Returns: Request for `Instance`.
    public static func current() -> Request<Instance> {
        return Request<Instance>(path: "/api/v1/instance")
    }

    /// Fetches current instance's custom emojis.
    ///
    /// - Returns: Request for `[Emoji]`.
    public static func customEmojis() -> Request<[Emoji]> {
        return Request<[Emoji]>(path: "/api/v1/custom_emojis")
    }
    
    /// Tags that are being used more frequently within the past week.
    ///
    /// - Returns: Request for `[Tag]`.
    public static func tagTrends(range: RequestRange) -> Request<[Tag]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, default: 20)) ?? []
        let method = HTTPMethod.get(.parameters(rangeParameters))

        return Request<[Tag]>(path: "/api/v1/trends/tags", method: method)
    }

    /// Statuses that have been interacted with more than others.
    ///
    /// - Returns: Request for `[Tag]`.
    public static func statusTrends(range: RequestRange) -> Request<[Status]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, default: 20)) ?? []
        let method = HTTPMethod.get(.parameters(rangeParameters))

        return Request<[Status]>(path: "/api/v1/trends/statuses", method: method)
    }
}
