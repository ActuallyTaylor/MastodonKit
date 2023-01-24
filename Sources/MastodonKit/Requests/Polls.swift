//
//  Polls.swift
//  
//
//  Created by Zachary Lineman on 1/24/23.
//

import Foundation

/// `Polls` requests.
public enum Polls {
    /// Fetches a poll by id.
    ///
    /// - Parameter id: The poll id.
    /// - Returns: Request for `Poll`.
    public static func poll(id: String) -> Request<Poll> {
        return Request<Poll>(path: "/api/v1/polls/\(id)")
    }

    /// Votes on a poll..
    ///
    /// - Parameter id: The poll id.
    /// - Returns: Request for `Poll`.
    public static func vote(id: String, choices: [Int]) -> Request<Poll> {
        let parameters = choices.map(toArrayOfParameters(withName: "choices"))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<Poll>(path: "/api/v1/polls/\(id)/vote", method: method)
    }

}
