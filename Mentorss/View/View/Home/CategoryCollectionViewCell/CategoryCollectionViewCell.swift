//
//  CategoryCollectionViewCell.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/19.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

   
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        baseView.layer.cornerRadius = 4
        categoryLabel.layer.cornerRadius = 4
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
