//
//  SearchViewController.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/20.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var searchBaseView: UIView!
    @IBOutlet weak var recommandKeywordCollectionView: UICollectionView!
    
    let testArray: [String] = ["학업", "학교생활", "취업/진로", "자격증", "대외활동", "해외유학", "자소서", "포트폴리오", "면접"]
    
    override func loadView() {
        super.loadView()
        configUI()
    }
    
    func configUI() {
        searchBaseView.layer.cornerRadius = 8
        searchBaseView.layer.borderWidth = 2
        searchBaseView.layer.borderColor = UIColor(named: "gray200")?.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        
    }
    
    func setCollectionView() {
        recommandKeywordCollectionView.delegate = self
        recommandKeywordCollectionView.dataSource = self
        recommandKeywordCollectionView.register(UINib(nibName: "RecommandKeywordCollectionView", bundle: nil), forCellWithReuseIdentifier: "RecommandKeywordCollectionView")
    }
    
    


}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandKeywordCollectionView", for: indexPath) as! RecommandKeywordCollectionView
        cell.categoryNameLabel.text = testArray[indexPath.item]
        return cell
    }
    
    
}


extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.recommandKeywordCollectionView.frame.width * 0.275
        let height = width * 0.59
        
        return CGSize(width: width, height: height)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 8


    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8

    }
    
    
}
