//
//  Poll.swift
//  
//
//  Created by Zachary Lineman on 1/24/23.
//

import Foundation

public struct Poll: Codable, Hashable {
    public struct Option: Codable, Hashable {
        /// The text value of the poll option.
        public let title: String
        /// The total number of received votes for this option.
        public let votesCount: Int?
        
        private enum CodingKeys: String, CodingKey {
            case title
            case votesCount = "votes_count"
        }
    }
    
    /// The ID of the poll in the database.
    public let id: String
    /// When the poll ends.
    public let expiresAt: Date?
    /// Is the poll currently expired?
    public let expired: Bool
    /// Does the poll allow multiple-choice answers?
    public let multiple: Bool
    /// How many votes have been received.
    public let votesCount: Int
    /// How many unique accounts have voted on a multiple-choice poll.
    public let votersCount: Int?
    /// Possible answers for the poll.
    public let options: [Option]
    /// Custom emoji to be used for rendering poll options.
    public let emojis: [Emoji]
    /// When called with a user token, has the authorized user voted?
    public let voted: Bool?
    /// When called with a user token, which options has the authorized user chosen? Contains an array of index values for `Options`.
    public let ownVotes: [Int]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case expiresAt = "expires_at"
        case expired
        case multiple
        case votesCount = "votes_count"
        case votersCount = "voters_count"
        case options
        case emojis
        case voted
        case ownVotes = "own_votes"
    }
}
