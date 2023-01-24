//
//  NotificationType.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum NotificationType: String, Codable, Hashable {
    /// The user has been mentioned.
    case mention
    /// The status message has been reblogged.
    case reblog
    /// The status message has been favourited.
    case favourite
    /// The user has a new follower.
    case follow
    /// Someone you enabled notifications for has posted a status
    case status
    /// Someone requested to follow you
    case follow_request
    /// A poll you have voted in or created has ended
    case poll
    /// A poll you have voted in or created has ended
    case update
}
