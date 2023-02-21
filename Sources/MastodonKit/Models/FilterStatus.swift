//
//  FilterStatus.swift
//  
//
//  Created by Zachary Lineman on 2/20/23.
//

import Foundation

public struct FilterStatus: Codable, Hashable {
    /// The ID of the FilterStatus in the database.
    public let id: String
    /// The ID of the Status that will be filtered.
    public let statusId: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case statusId = "status_id"
    }
}
