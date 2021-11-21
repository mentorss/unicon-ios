//
//  MentorProfileViewController.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/20.
//

import UIKit

class MentorProfileViewController: UIViewController {
    
    
    
    @IBOutlet weak var mentorProfileCollectionView: UICollectionView!
    @IBOutlet weak var mainTitleLabel: UILabel!

    lazy var profileInfoHeaderCollectionReusableView: ProfileInfoHeaderCollectionReusableView = ProfileInfoHeaderCollectionReusableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        addEdgePanGesture()
       
        profileInfoHeaderCollectionReusableView.mainView = self
    }
    
    func addEdgePanGesture() {
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(leftEdgeSwipe))
        edgePan.edges = .left
        self.view.addGestureRecognizer(edgePan)
    }
    
    @objc func leftEdgeSwipe(_ recognizer: UIScreenEdgePanGestureRecognizer) {
       if recognizer.state == .recognized {
          self.navigationController?.popViewController(animated: true)
       }
    }
    
    func setCollectionView() {
        mentorProfileCollectionView.delegate = self
        mentorProfileCollectionView.dataSource = self
        mentorProfileCollectionView.register(UINib(nibName: "MentorProfileInfoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MentorProfileInfoCollectionViewCell")
        mentorProfileCollectionView.register(UINib(nibName: "ProfileInfoHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "ProfileInfoHeaderCollectionReusableView")
        mentorProfileCollectionView.register(UINib(nibName: "ProfileTabsCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "ProfileTabsCollectionReusableView")
        
        let layout = mentorProfileCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionHeadersPinToVisibleBounds = true
        
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}


extension MentorProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }
        
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MentorProfileInfoCollectionViewCell", for: indexPath) as! MentorProfileInfoCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        if indexPath.section == 1 {
            let tabControllHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileTabsCollectionReusableView", for: indexPath) as! ProfileTabsCollectionReusableView
            
            tabControllHeader.delegate = self
            
            return tabControllHeader
        }
        
        let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileInfoHeaderCollectionReusableView", for: indexPath) as! ProfileInfoHeaderCollectionReusableView
        
        return profileHeader
    }
    
    
    
}

extension MentorProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
      
            return CGSize(width: self.mentorProfileCollectionView.frame.width, height: self.mentorProfileCollectionView.frame.width * (207.5 / 375))
            
            //return CGSize(width: self.mentorProfileCollectionView.frame.width, height: profileInfoHeaderCollectionReusableView.height)
        }
        return CGSize(width: self.mentorProfileCollectionView.frame.width, height: self.mentorProfileCollectionView.frame.width * 0.128)
    }
}

extension MentorProfileViewController: ProfileTabsCollectionReusableViewDelegate {
    func didTapGridButtonTab() {
        print("didTapGridButtonTab")
        
        
    }
    
    func didTapTagButtonTab() {
        print("didTapTagButtonTab")
        
    }
    
    
}
