//
//  File.swift
//  
//
//  Created by Taylor Lineman on 4/12/23.
//

import Foundation

/// `Streaming` requests
public enum Streaming {
    /// Fetches the health of the streaming server.
    ///
    /// - Returns: Request for `[Account]`.
    public static func checkHealth() -> Request<Empty>  {
        return Request<Empty>(path: "/api/v1/streaming/health", method: .get(.empty))
    }
    
    /// Fetches the health of the streaming server.
    ///
    /// - Returns: Request for `[Account]`.
    public static func user() -> Request<Empty>  {
        return Request<Empty>(path: "/api/v1/streaming/user", method: .get(.empty))
    }
    
    
    public static func streaming() -> Request<Empty> {
        return Request<Empty>(path: "/api/v1/streaming/", method: .get(.empty))
    }
}
