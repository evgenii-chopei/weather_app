//
//  Network.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/30/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import Foundation
import Alamofire

public struct Network{
    
    static let publicSession: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = true
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let session = Alamofire.SessionManager(configuration: configuration)
        return session
    }()
    
    public func request<T:Codable,E:URLRequestConvertible>(_ endpoint:E,  responce: @escaping (_ object:T)->Void) {
        Network.publicSession.request(endpoint).responseData  {  data in
            do {
                guard let d = data.data else {
                    return
                }
                responce(try JSONDecoder().decode(T.self, from: d))
            } catch {
                debugPrint(error)
                fatalError("API cnahged")
                
            }
        }
    }
    
}
