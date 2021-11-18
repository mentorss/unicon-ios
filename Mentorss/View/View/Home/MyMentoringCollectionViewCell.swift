//
//  MyMentoringCollectionViewCell.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/19.
//

import UIKit

class MyMentoringCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var mentoringStateLabel: UILabel!
    
    @IBOutlet weak var menteeProfileImage: UIImageView!
    @IBOutlet weak var menteeHornImage: UIImageView!
    @IBOutlet weak var menteeNameLabel: UILabel!
    
    @IBOutlet weak var mentorProfileImage: UIImageView!
    @IBOutlet weak var mentorHornImage: UIImageView!
    @IBOutlet weak var mentorNameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutIfNeeded()
        
        baseView.layer.cornerRadius = 8
        baseView.layer.shadowColor = UIColor(named: "primary800")?.cgColor
        baseView.layer.shadowOffset = CGSize(width: 0, height: 1)
        baseView.layer.shadowOpacity = 0.2
        baseView.layer.shadowRadius = 1.0
        
        menteeProfileImage.layer.cornerRadius = menteeProfileImage.frame.height / 2
        mentorProfileImage.layer.cornerRadius = mentorProfileImage.frame.height / 2
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()

        
        setCollectionView()
        
    }
    
    func setCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
    
    
}


extension MyMentoringCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        return cell
    }
    
    
}


extension MyMentoringCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        let width = cell.categoryLabel.frame.width
        let height = self.categoryCollectionView.frame.height
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }

    
}
