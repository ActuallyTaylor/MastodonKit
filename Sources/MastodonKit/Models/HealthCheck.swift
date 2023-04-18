//
//  HealthCheck.swift
//  
//
//  Created by Taylor Lineman on 4/12/23.
//

import Foundation

public struct HealthCheck: Codable, Hashable {
    public let status: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.status = try container.decode(String.self)
    }
}
