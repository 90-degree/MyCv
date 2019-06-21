//
//  MotivationPopUpViewController.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/15/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import UIKit

class MotivationPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentViewOutlet: UIView!
    
    
    @IBOutlet weak var motivationTextLabel1: UILabel!
    @IBOutlet weak var motivationTextLabelCenterConstraint1: NSLayoutConstraint!
    
    @IBOutlet weak var motivationTextLabel2: UILabel!
    @IBOutlet weak var motivationTextLabelCenterConstraint2: NSLayoutConstraint!

    @IBOutlet weak var motivationTextLabel3: UILabel!
    @IBOutlet weak var motivationTextLabelCenterConstraint3: NSLayoutConstraint!
    
    @IBOutlet weak var motivationTextLabel4: UILabel!
    @IBOutlet weak var motivationTextLabelCenterConstraint4: NSLayoutConstraint!
    
    @IBOutlet weak var motivationTextLabel5: UILabel!
    @IBOutlet weak var motivationTextLabelCenterConstraint5: NSLayoutConstraint!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonCenterConstraint: NSLayoutConstraint!
    
    
    let maskView = UIView(frame: CGRect(x: 160, y: 40, width: 80, height: 80))
    
    let scaleFactor:CGFloat = 5.2

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor.black.withAlphaComponent(1.0)
        motivationTextLabel1.text = PersonalInformations.motivation[0]
        motivationTextLabelCenterConstraint1.constant += view.bounds.height
        motivationTextLabel1.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        motivationTextLabel2.text = PersonalInformations.motivation[1]
        motivationTextLabelCenterConstraint2.constant += view.bounds.height
        motivationTextLabel2.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        motivationTextLabel3.text = PersonalInformations.motivation[2]
        motivationTextLabelCenterConstraint3.constant += view.bounds.height
        motivationTextLabel3.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        motivationTextLabel4.text = PersonalInformations.motivation[3]
        motivationTextLabelCenterConstraint4.constant += view.bounds.height
        motivationTextLabel4.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        motivationTextLabel5.text = PersonalInformations.motivation[4]
        motivationTextLabelCenterConstraint5.constant += view.bounds.height
        motivationTextLabel5.transform = CGAffineTransform(scaleX: 2, y: 2)

        maskView.layer.cornerRadius = 40
        maskView.backgroundColor = .blue
        contentViewOutlet.mask = maskView
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        animateSearch()
        scaleAnimation()
        textAnimation(onTextLabel: motivationTextLabel1, atConstraint: motivationTextLabelCenterConstraint1, withDuration: 15, startingDelay: 4)
        textAnimation(onTextLabel: motivationTextLabel2, atConstraint: motivationTextLabelCenterConstraint2, withDuration: 15, startingDelay: 6.5)
        textAnimation(onTextLabel: motivationTextLabel3, atConstraint: motivationTextLabelCenterConstraint3, withDuration: 15, startingDelay: 9)
        textAnimation(onTextLabel: motivationTextLabel4, atConstraint: motivationTextLabelCenterConstraint4, withDuration: 15, startingDelay: 11.5)
        textAnimation(onTextLabel: motivationTextLabel5, atConstraint: motivationTextLabelCenterConstraint5, withDuration: 15, startingDelay: 14)
        buttonReturns()
    }
    

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("popUpViewDissmised"), object: nil,userInfo: ["sender":Controller.motivation])
        view.removeFromSuperview()
    }
    

    
    
    
    func animateSearch() {
        UIView.animate(withDuration: 1.5, delay: 0.3, options: .curveEaseInOut, animations: {
            self.maskView.transform = CGAffineTransform(translationX: -120/self.scaleFactor, y: 15/self.scaleFactor)
            self.view.layoutIfNeeded()
        }, completion: nil)

        UIView.animate(withDuration: 1.5, delay: 1.8, options: .curveEaseInOut, animations: {
            self.maskView.transform = CGAffineTransform(translationX: 0, y: 33/self.scaleFactor)
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 3.3, options: .curveEaseInOut, animations: {
            self.maskView.transform = CGAffineTransform(translationX: -120/self.scaleFactor, y: 51/self.scaleFactor)
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 4.8, options: .curveLinear, animations: {
            self.maskView.transform = CGAffineTransform(translationX: -80/self.scaleFactor, y: 90/self.scaleFactor)
            self.view.layoutIfNeeded()
            
        },completion: nil )
        

    }
    
    func scaleAnimation() {
        UIView.animate(withDuration: 0.6, delay: 5.2, options: .curveEaseInOut, animations: {
            self.maskView.transform = CGAffineTransform(translationX: -80, y: 90).scaledBy(x: self.scaleFactor, y: self.scaleFactor)
            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 5.4, options: .curveEaseInOut, animations: {
            self.nextButtonOutlet.transform = CGAffineTransform(scaleX: 4, y: 4)
            self.view.layoutIfNeeded()
        }, completion: {(finished) -> Void in
            if finished {
                self.nextButtonCenterConstraint.constant += self.view.bounds.height
                self.contentViewOutlet.backgroundColor = UIColor(rgb: 0x263238)
                self.view.backgroundColor = UIColor(rgb: 0x263238)
                self.nextButtonOutlet.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
        })
        
    }
    
    
    
    
    func textAnimation(onTextLabel label:UILabel,atConstraint constraint:NSLayoutConstraint,withDuration dur:TimeInterval, startingDelay start:TimeInterval) {
        UIView.animate(withDuration: dur, delay: start, options: .curveLinear, animations: {
            constraint.constant -= self.view.bounds.height*2
            label.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func buttonReturns() {
        UIView.animate(withDuration: 7, delay: 17, options: .curveLinear, animations: {
            self.nextButtonCenterConstraint.constant -= self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    

}
