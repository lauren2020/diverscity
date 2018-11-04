//
//  UserSession.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/15/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation

struct UserSession {
    static var user: User?
    static var api = API()
    static var selectedCommunity: Community?
    let urlComponents: URLComponents = URLComponents(string: "https://divircity-api.herokuapp.com/api/v1/users")!
    
    let session: URLSession = URLSession.shared
}
