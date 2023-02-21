//
//  Conversation.swift
//  
//
//  Created by Zachary Lineman on 2/20/23.
//

import Foundation

public struct Conversation: Codable, Hashable {
    /// The ID of the conversation in the database.
    public let id: String
    /// Is the conversation currently marked as unread?
    public let unread: Bool
    /// Participants in the conversation.
    public let accounts: [Account]
    /// The last status in the conversation.
    public let lastStatus: Status?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case unread
        case accounts
        case lastStatus = "last_status"
    }
}
