//
//  MentorProfileViewController.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/20.
//

import UIKit

class MentorProfileViewController: UIViewController {
    
    
    @IBOutlet weak var mentorProfileBaseView: MentorProfileView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mentorProfileImage: UIImageView!
    @IBOutlet weak var mentorHornImage: UIImageView!
    @IBOutlet weak var mentorNameLabel: UILabel!
    @IBOutlet weak var mentorTitleLabel: UILabel!
    @IBOutlet weak var totalMentoringCountLabel: UILabel!
    @IBOutlet weak var satisfactionPercentLabel: UILabel!
    @IBOutlet weak var mentoringSubscriptionButton: UIButton!

    
    override func loadView() {
        super.loadView()
        configUI()
        
    }
    
    func configUI() {
        mentorProfileImage.layer.cornerRadius = mentorProfileImage.frame.height / 2
        mentoringSubscriptionButton.layer.cornerRadius = 4
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mentorProfileBaseView.scrollViewDidScroll(view: mentorProfileBaseView)
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(leftEdgeSwipe))
        edgePan.edges = .left
        self.view.addGestureRecognizer(edgePan)

     
        
        // Do any additional setup after loading the view.
    }
    
    @objc func leftEdgeSwipe(_ recognizer: UIScreenEdgePanGestureRecognizer) {
       if recognizer.state == .recognized {
          self.navigationController?.popViewController(animated: true)
       }
    }
    
    
    
    
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

