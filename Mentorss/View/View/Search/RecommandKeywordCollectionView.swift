//
//  RecommandKeywordCollectionView.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/20.
//

import UIKit

class RecommandKeywordCollectionView: UICollectionViewCell {
   
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        
        baseView.layer.cornerRadius = 4
        baseView.layer.borderWidth = 1
        baseView.layer.borderColor = UIColor(named: "gray200")?.cgColor
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
