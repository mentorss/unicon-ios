//
//  LoginRepository.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/22.
//

import Foundation
import Alamofire

class LoginRepository {
    func postLogin(_ parameters: LoginRequest, onCompleted: @escaping (LoginResponse) -> Void, onError: @escaping (String) -> Void) {
        AF.request("\(ConstantURL.BASE_URL)/auth/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("LoginRepository - postLogin Success")
                    onCompleted(response)
                case .failure(let error):
                    onError("LoginRepository - postLogin Error: \(error)")
                }
                
            }
    }
}

