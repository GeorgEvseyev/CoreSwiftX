//
//  URLExtensions'.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension URL {
    static func phone(phoneNumber : String) -> URL {
        var components = URLComponents()
        components.scheme = "tel"
        components.path = phoneNumber
        return components.url!
    }
    static func email(email : String, subject : String, body : String) -> URL {
        var components = URLComponents()
        components.scheme = "mailto"
        components.path = email
        components.queryItems = [URLQueryItem(name: "subject", value: subject),URLQueryItem(name: "body", value: body)]
        return components.url!
    }
}
