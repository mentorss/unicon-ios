//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/21.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var baseView: UIView!
    weak var mainView: MentorProfileViewController?
    
    var height: CGFloat = 0.0 {
        didSet {
            mainView?.mentorProfileCollectionView.reloadData()
            print("heigh: \(height)")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("draw")
        self.height = self.baseView.frame.height
    }

}
