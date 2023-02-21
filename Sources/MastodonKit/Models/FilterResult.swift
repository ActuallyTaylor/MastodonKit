//
//  File.swift
//  
//
//  Created by Zachary Lineman on 2/20/23.
//

import Foundation

public struct FilterResult: Codable, Hashable {
    /// The filter that was matched.
    public let filter: Filter
    /// The keyword within the filter that was matched.
    public let keywordMatches: [String]?
    /// The status ID within the filter that was matched.
    public let statusMatches: String?
    
    private enum CodingKeys: String, CodingKey {
        case filter
        case keywordMatches = "keyword_matches"
        case statusMatches = "status_matches"
    }
}
