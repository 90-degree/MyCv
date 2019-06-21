//
//  BabyPopUpViewController.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/14/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import UIKit


class BabyPopUpViewController: UIViewController {

    
    @IBOutlet weak var babyTextLabel: UILabel!
    
    @IBOutlet weak var mineImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        mineImageView.frame = CGRect(origin: mineImageView.frame.origin, size: CGSize(width: 1000, height: 1000))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.mineImageView.frame = CGRect(origin: self.mineImageView.frame.origin, size: CGSize(width: 173, height: 165))
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        typewriter()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name("popUpViewDissmised"), object: nil,userInfo: ["sender":Controller.baby])
        view.removeFromSuperview()
        
    }
    
    
    func typewriter() {
        babyTextLabel.text = ""
        for char in PersonalInformations.birthDay {
            babyTextLabel.text! += "\(char)"
            RunLoop.current.run(until: Date()+0.05)
        }
    }

}
