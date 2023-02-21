//
//  File.swift
//  
//
//  Created by Zachary Lineman on 2/20/23.
//

import Foundation

/// Represents a keyword that, if matched, should cause the filter action to be taken.
public struct Filter: Codable, Hashable {
    public enum FilterContext: String, Codable {
        case home
        case notifications
        case `public`
        case thread
        case account
    }
    
    public enum FilterAction: String, Codable {
        case warn
        case hide
    }
    
    /// The ID of the Filter in the database.
    public let id: String
    /// A title given by the user to name the filter.
    public let title: String
    /// The contexts in which the filter should be applied.
    public let context: [FilterContext]
    /// When the filter should no longer be applied.
    public let expiresAt: Date?
    /// The action to be taken when a status matches this filter.
    public let filterAction: FilterAction
    /// The keywords grouped under this filter.
    public let keywords: [FilterKeyword]
    /// The statuses grouped under this filter.
    public let statuses: [FilterStatus]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case context
        case expiresAt = "expires_at"
        case filterAction = "filter_action"
        case keywords
        case statuses
    }
}
