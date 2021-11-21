//
//  LoginViewModel.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/22.
//

import Foundation

class LoginViewModel {
    weak var loginView: LoginViewController?
    let useService = LoginService()
    var goMainView: () -> Void = {}
    var showAlert: (_ message: String) -> Void = {_ in}
    
    func postLogin(_ parameters: LoginRequest) {
        useService.postLogin(parameters, onCompleted: { [weak self] response in
            guard let self = self else {return}
            let message = response.message
            let code = response.code
            
            if response.isSuccess == true {
                let loginResult = response.result
                UserDefaults.standard.set(loginResult?.token, forKey: UserDefaultKey.jwtToken)
                UserDefaults.standard.set(loginResult?.userIdx, forKey: UserDefaultKey.userIdx)
                print("로그인 성공!")
                self.goMainView()
              
            } else {
                print("\(code) Error")
                self.showAlert(message)
            }
        }, onError: {error in
            print("loginViewModel - \(error)")
        })
    }
}
