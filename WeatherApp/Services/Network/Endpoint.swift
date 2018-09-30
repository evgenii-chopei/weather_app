//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/30/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation

enum RequestMethod: String {
    case get, post
}
protocol Endpoint {
    
    var baseURL: String { get }
    var parameters: [String: Any] { get }
    var path: String { get }
    var method: RequestMethod { get }
    
}

extension Endpoint {
    
//    func asURLRequest() throws -> URLRequest {
//        let url = try? baseURL.asURL()
//        var urlRequest = URLRequest(url: (url?.appendingPathComponent(path))!)
//        urlRequest.httpMethod = method.rawValue
//        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
//        return urlRequest
//    }
    
}
