//
//  LoginService.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/22.
//

import Foundation

class LoginService {
    let repository: LoginRepository = LoginRepository()
    
    func postLogin(_ parameters: LoginRequest, onCompleted: @escaping (LoginResponse) -> Void, onError: @escaping (String) -> Void) {
        repository.postLogin(parameters, onCompleted: { response in
            let responseData = LoginResponse(isSuccess: response.isSuccess, code: response.code, message: response.message, result: response.result)
            onCompleted(responseData)
        }, onError: onError)
    }
}
