//
//  LoginViewController.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/19.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainNav = storyBoard.instantiateViewController(identifier: "MainNav")
        self.changeRootViewController(mainNav)
    }
    

}
