//
//  FilterKeyword.swift
//  
//
//  Created by Zachary Lineman on 2/20/23.
//

import Foundation

/// Represents a keyword that, if matched, should cause the filter action to be taken.
public struct FilterKeyword: Codable, Hashable {
    /// The ID of the FilterKeyword in the database.
    public let id: String
    /// The phrase to be matched against.
    public let keyword: String
    /// Should the filter consider word boundaries? See implementation guidelines for filters.
    public let wholeWord: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case keyword
        case wholeWord = "whole_word"
    }
}
