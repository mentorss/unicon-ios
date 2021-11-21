//
//  ProfileTabsCollectionReusableView.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/22.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    func didTapGridButtonTab()
    func didTapTagButtonTab()
}


class ProfileTabsCollectionReusableView: UICollectionReusableView {
    
    
    @IBOutlet weak var introButton: UIButton!
    @IBOutlet weak var introBottomLineView: UIView!
    @IBOutlet weak var reviewButton: UIButton!
    
    @IBOutlet weak var reviewBottomLineView: UIView!
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?

    

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        
        introBottomLineView.isHidden = false
        reviewBottomLineView.isHidden = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("ProfileTabsCollectionReusableView")
        
        introButton.tag = 0
        reviewButton.tag = 1
        
        introButton.addTarget(self, action: #selector(didTapIntroButtonTab), for: .touchUpInside)
        reviewButton.addTarget(self, action: #selector(didTapReviewButtonTab), for: .touchUpInside)
        
    }
    
    
    @objc private func didTapIntroButtonTab() {
        layoutIfNeeded()
        introButton.setTitleColor(UIColor(named: "primary800"), for: .normal)
        reviewButton.setTitleColor(UIColor(named: "gray200"), for: .normal)
        print(introButton.tag)
        DispatchQueue.main.async {
            self.introBottomLineView.isHidden = false
            self.reviewBottomLineView.isHidden = true
        }
        
        delegate?.didTapGridButtonTab()
    }
    
    @objc private func didTapReviewButtonTab() {
        layoutIfNeeded()
        introButton.setTitleColor(UIColor(named: "gray200"), for: .normal)
        reviewButton.setTitleColor(UIColor(named: "primary800"), for: .normal)
        
        DispatchQueue.main.async {
            self.introBottomLineView.isHidden = true
            self.reviewBottomLineView.isHidden = false
        }
        
        delegate?.didTapTagButtonTab()
    }
}
