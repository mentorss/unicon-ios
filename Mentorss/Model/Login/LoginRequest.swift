//
//  LoginRequest.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/22.
//

import Foundation

struct LoginRequest: Encodable {
    var email: String
    var password: String
}
