//
//  Rule.swift
//  
//
//  Created by Taylor Lineman on 3/16/23.
//

import Foundation

public struct Rule: Codable, Hashable {
    /// An identifier for the rule.
    public let id: String
    /// The rule to be followed..
    public let text: String
}
