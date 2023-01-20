//
//  Tag.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Tag: Codable, Hashable {
    /// The hashtag, not including the preceding #.
    public let name: String
    /// The URL of the hashtag.
    public let url: String
    /// Usage statistics for given days (typically the past week).
    public let history: [History]?
    /// Whether the current token’s authorized user is following this tag.
    public let following: Bool?
    
    public struct History: Codable, Hashable {
        /// UNIX timestamp on midnight of the given day.
        public let day: String
        /// The counted usage of the tag within that day.
        public let uses: String
        ///The total of accounts using the tag within that day.
        public let accounts: String
    }
}
