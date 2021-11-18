//
//  HomeViewController.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/19.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var showDetailStackView: UIStackView!
    
    @IBOutlet weak var findMyOwnMentorButton: UIButton!
    @IBOutlet weak var challengeMentorButton: UIButton!
    
    
    override func loadView() {
        super.loadView()
        configUI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // 홈화면 UI 함수
    
    func configUI() {
        findMyOwnMentorButton.layer.cornerRadius = 4
        findMyOwnMentorButton.layer.shadowColor = UIColor(named: "primary800")?.cgColor
        findMyOwnMentorButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        findMyOwnMentorButton.layer.shadowOpacity = 0.2
        
        
        challengeMentorButton.layer.cornerRadius = 4
        challengeMentorButton.layer.shadowColor = UIColor(named: "primary800")?.cgColor
        challengeMentorButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        challengeMentorButton.layer.shadowOpacity = 0.2
        
        
    }


}
