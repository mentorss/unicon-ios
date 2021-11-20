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
    @IBOutlet weak var myMentoringCollectionView: UICollectionView!
    @IBOutlet weak var realtimeTwinkleMentorCollectionView: UICollectionView!
    @IBOutlet weak var challengeMentorButton: UIButton!
    @IBOutlet weak var mySuggestionMentorTableView: UITableView!
    
    
    
    
    
    override func loadView() {
        super.loadView()
        configUI()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("change git repo name test")
        
        setCollectionView()
        setTableView()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    

    
    func setCollectionView() {
        
        myMentoringCollectionView.delegate = self
        myMentoringCollectionView.dataSource = self
        myMentoringCollectionView.register(UINib(nibName: "MyMentoringCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyMentoringCollectionViewCell")
        
        realtimeTwinkleMentorCollectionView.delegate = self
        realtimeTwinkleMentorCollectionView.dataSource = self
        realtimeTwinkleMentorCollectionView.register(UINib(nibName: "RealtimeTwinkleMentorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RealtimeTwinkleMentorCollectionViewCell")
        
    }
    
    func setTableView() {
        mySuggestionMentorTableView.separatorStyle = .none
        
        mySuggestionMentorTableView.delegate = self
        mySuggestionMentorTableView.dataSource = self
        mySuggestionMentorTableView.register(UINib(nibName: "MySuggestionMentorTableViewCell", bundle: nil), forCellReuseIdentifier: "MySuggestionMentorTableViewCell")
    }
    
    

    

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == myMentoringCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyMentoringCollectionViewCell", for: indexPath) as! MyMentoringCollectionViewCell
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RealtimeTwinkleMentorCollectionViewCell", for: indexPath) as! RealtimeTwinkleMentorCollectionViewCell
            if indexPath.row % 2 == 0 {
                cell.mentoringDescriptionLabel.text = "aa"
            }
            return cell
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Mentor", bundle: nil)
        let mainPresentVC = storyBoard.instantiateViewController(withIdentifier: "MentorProfileViewController") as! MentorProfileViewController
        self.navigationController?.pushViewController(mainPresentVC, animated: true)
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == myMentoringCollectionView {
            let width = self.myMentoringCollectionView.frame.width * 0.81
            let height = self.myMentoringCollectionView.frame.height
            
            
            return CGSize(width: width, height: height)
        } else {
            let width = self.realtimeTwinkleMentorCollectionView.frame.width * 0.395
            let height = self.realtimeTwinkleMentorCollectionView.frame.height
            
            
            return CGSize(width: width, height: height)
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 12


    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0

    }
    
    
    
}







extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MySuggestionMentorTableViewCell", for: indexPath) as! MySuggestionMentorTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.mySuggestionMentorTableView.frame.height / 3
    }
    
    
}
