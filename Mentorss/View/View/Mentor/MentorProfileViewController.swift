//
//  MentorProfileViewController.swift
//  Mentorss
//
//  Created by 구본의 on 2021/11/20.
//

import UIKit
import PagingKit

class MentorProfileViewController: UIViewController {
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
          let vc = UIViewController()
           vc.view.backgroundColor = color
           return vc
       }
       
       var dataSource = [(menuTitle: "test1", vc: viewController(.red)), (menuTitle: "test2", vc: viewController(.blue)), (menuTitle: "test3", vc: viewController(.yellow))]
    
    
    
    

    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mentorProfileImage: UIImageView!
    @IBOutlet weak var mentorHornImage: UIImageView!
    @IBOutlet weak var mentorNameLabel: UILabel!
    @IBOutlet weak var mentorTitleLabel: UILabel!
    @IBOutlet weak var totalMentoringCountLabel: UILabel!
    @IBOutlet weak var satisfactionPercentLabel: UILabel!
    @IBOutlet weak var mentoringSubscriptionButton: UIButton!
    
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    override func loadView() {
        super.loadView()
        configUI()
        
    }
    
    func configUI() {
        mentorProfileImage.layer.cornerRadius = mentorProfileImage.frame.height / 2
        mentoringSubscriptionButton.layer.cornerRadius = 4
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let vc = segue.destination as? PagingMenuViewController {
             menuViewController = vc
             menuViewController.dataSource = self
             menuViewController.delegate = self
         } else if let vc = segue.destination as? PagingContentViewController {
             contentViewController = vc
             contentViewController.dataSource = self
             contentViewController.delegate = self
         }
     }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        
        menuViewController.reloadData()
        contentViewController.reloadData()
        
        
        
        //let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(leftEdgeSwipe))
       // edgePan.edges = .left

//        view.addGestureRecognizer(edgePan)

     
        
        // Do any additional setup after loading the view.
    }
    
//    // Method to go back
//    @objc func leftEdgeSwipe(_ recognizer: UIScreenEdgePanGestureRecognizer) {
//       if recognizer.state == .recognized {
//          self.navigationController?.popViewController(animated: true)
//       }
//    }
    
    
    
    
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}



extension MentorProfileViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 100
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menuTitle
        return cell
    }
}

extension MentorProfileViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}


extension MentorProfileViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].vc
    }
}

extension MentorProfileViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
