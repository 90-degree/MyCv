//
//  UniversityPopUpViewController.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/14/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import UIKit

class UniversityPopUpViewController: UIViewController {
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    @IBOutlet weak var contextViewOutlet: UIView!
    
    @IBOutlet weak var universityTextLabel: UILabel!
    @IBOutlet weak var universityLabelUpConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        universityTextLabel.text = PersonalInformations.faculty
        universityLabelUpConstraint.constant -= view.bounds.height

    }
    override func viewDidAppear(_ animated: Bool) {
        textAnimation()
        transAnimation()
        
        
    }
    

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("popUpViewDissmised"), object: nil,userInfo: ["sender":Controller.university])
        view.removeFromSuperview()
    }
    
    func transAnimation() {
    
        var a = 4.0
        var i = 0.4
        for _ in 1...4 {

            UIView.animate(withDuration: 0.25, delay: i, options: [.curveEaseIn,.allowUserInteraction], animations: {
                self.nextButtonOutlet.transform = CGAffineTransform(rotationAngle: CGFloat(.pi/a))
            }, completion: nil)
            UIView.animate(withDuration: 0.25, delay: i + 0.25, options: [.curveEaseIn,.allowUserInteraction], animations: {
                self.nextButtonOutlet.transform = CGAffineTransform(rotationAngle: CGFloat(-.pi/a))
            }, completion: nil)
            a -= 0.75
            i += 0.5
        }
        UIView.animate(withDuration: 0.5, delay: 2.4, options: [.curveEaseIn,.allowUserInteraction], animations: {
            self.nextButtonOutlet.transform = CGAffineTransform(rotationAngle: -.pi)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 2.2, options: [.curveEaseIn,.allowUserInteraction], animations: {
            var point = self.nextButtonOutlet.frame.origin
            point.y += 320
            self.nextButtonOutlet.frame = CGRect(origin: point, size: CGSize(width: 100, height: 40))
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    func textAnimation() {
        UIView.animate(withDuration: 0.7, delay: 0,usingSpringWithDamping: 0.5,initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
            self.universityLabelUpConstraint.constant += self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}
