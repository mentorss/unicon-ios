//
//  LoginResponse.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/22.
//

import Foundation

struct LoginResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoginResult?
        
}

struct LoginResult: Decodable {
    var token: String
    var userIdx: Int
}
