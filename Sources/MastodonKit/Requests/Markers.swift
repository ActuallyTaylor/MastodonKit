//
//  Markers.swift
//  
//
//  Created by Zachary Lineman on 2/12/23.
//

import Foundation

/// `Media` requests.
public enum Markers {
    public enum Timeline: String {
        case home
        case notifications
    }
    
    /// Retrieves the marker for the users current timeline position.
    ///
    /// - Parameter timeline: The timelines that you are getting markers for
    /// - Returns: Request for `Attachment`.
    public static func getMarkers(timelines: [Timeline] = [.home, .notifications]) -> Request<MarkerPackage> {
        let localParameters = timelines.map(toArrayOfParameters(withName: "v"))
        
        let method = HTTPMethod.get(.parameters(localParameters))
        return Request<MarkerPackage>(path: "/api/v1/markers", method: method)
    }
    
    public static func setHomeMarker(homeID: String) -> Request<MarkerPackage> {
        let localParameters = [
            Parameter(name: "home[last_read_id]", value: homeID)
        ]
        let method = HTTPMethod.post(.parameters(localParameters))
        return Request<MarkerPackage>(path: "/api/v1/markers", method: method)
    }
    
    public static func setNotificationsMarker(notificationID: String) -> Request<MarkerPackage> {
        let localParameters = [
            Parameter(name: "notifications[last_read_id]", value: notificationID)
        ]
        let method = HTTPMethod.post(.parameters(localParameters))
        return Request<MarkerPackage>(path: "/api/v1/markers", method: method)
    }
}
