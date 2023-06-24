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
        return Request<Instance>(path: "/api/v2/instance")
    }
    
    /// Domains that this instance is aware of.
    ///
    /// - Returns: Request for `[String]`.
    public static func peers() -> Request<[String]> {
        return Request<[String]>(path: "/api/v1/instance/peers")
    }
    
    /// Instance activity over the last 3 months, binned weekly.
    ///
    /// - Returns: Request for `[InstanceActivity]`.
    public static func activity() -> Request<[InstanceActivity]> {
        return Request<[InstanceActivity]>(path: "/api/v1/instance/activity")
    }

    /// Rules that the users of this service should follow.
    ///
    /// - Returns: Request for `[InstanceActivity]`.
    public static func rules() -> Request<[Rule]> {
        return Request<[Rule]>(path: "/api/v1/instance/rules")
    }
    
    /// Obtain an extended description of this server.
    ///
    /// - Returns: Request for `InstanceExtendedDescription`.
    public static func extendeDescription() -> Request<InstanceExtendedDescription> {
        return Request<InstanceExtendedDescription>(path: "/api/v1/instance/extended_description")
    }
    
    
    /// Obtain a list of domains that have been blocked..
    ///
    /// - Returns: Request for `[DomainBlock]`.
    public static func domainBlocks() -> Request<[DomainBlock]> {
        return Request<[DomainBlock]>(path: "/api/v1/instance/domain_blocks")
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
    
    /// Links that have been shared more than others.
    ///
    /// - Returns: Request for `[Card]`.
    public static func linkTrends(range: RequestRange) -> Request<[Card]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, default: 20)) ?? []
        let method = HTTPMethod.get(.parameters(rangeParameters))

        return Request<[Card]>(path: "/api/v1/trends/links", method: method)
    }

}
