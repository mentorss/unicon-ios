//
//  LoginViewController.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/19.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    lazy var viewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.loginView = self
        
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        
        guard let user_email = emailTextField.text?.trim, user_email.isExists else {
            self.presentAlert(title: "이메일을 입력 해주세요")
            return
        }

        guard let user_pw = passwordTextField.text?.trim, user_pw.isExists else {
            self.presentAlert(title: "비밀번호를 입력 해주세요")
            return
        }
        
        let param = LoginRequest(email: user_email, password: user_pw)
        
        viewModel.postLogin(param)
        

    }
}

extension LoginViewController {
    func viewModelMethod() {
        
        viewModel.showAlert = {[self] message in
            let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
        
        viewModel.goMainView = {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let mainNav = storyBoard.instantiateViewController(identifier: "MainNav")
            self.changeRootViewController(mainNav)
        }
    }
}
