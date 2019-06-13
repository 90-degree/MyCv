//
//  MainViewController.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/12/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var babyButtonOutlet: UIButton!
    @IBOutlet weak var babyButtonCenterConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var schoolBusButtonOutlet: UIButton!
    @IBOutlet weak var schoolBusCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var universityButtonOutlet: UIButton!
    @IBOutlet weak var universityButtonUpConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var certificateButtonOutlet: UIButton!
    @IBOutlet weak var certificateButtonUpConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var workerButtonOutlet: UIButton!
    @IBOutlet weak var workerButtonCenterConstraint: NSLayoutConstraint!
    
    
    
    
    var schoolBusAnimationDone = false
    var universityAnimationDone = false
    var certificateAnimationDone = false
    var workerAnimationDone = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        babyButtonCenterConstraint.constant += view.bounds.width
        schoolBusCenterConstraint.constant -= view.bounds.width
        universityButtonUpConstraint.constant += view.bounds.height
        certificateButtonUpConstraint.constant -= view.bounds.height*3
        workerButtonCenterConstraint.constant += view.bounds.width


    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6, delay: 0.1, options: .curveEaseInOut, animations: {
            self.babyButtonCenterConstraint.constant -= self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
    }

    @IBAction func babyButtonTapped(_ sender: UIButton) {
        if !schoolBusAnimationDone {
            UIView.animate(withDuration: 0.6, delay: 0.1, options: .transitionCrossDissolve, animations: {
                self.schoolBusCenterConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            schoolBusAnimationDone = true
        }
    }
    
    @IBAction func schoolBusButtonTapped(_ sender: UIButton) {
        if !universityAnimationDone {
            UIView.animate(withDuration: 0.6, delay: 0.1, options: .transitionFlipFromLeft, animations: {
                self.universityButtonUpConstraint.constant -= self.view.bounds.height
                self.view.layoutIfNeeded()
            }, completion: nil)
            universityAnimationDone = true
        }
        
    }
    
    @IBAction func universityButtonTapped(_ sender: UIButton) {
        if !certificateAnimationDone {
            UIView.animate(withDuration: 0.6, delay: 0.1, options: .curveEaseIn, animations: {
                self.certificateButtonUpConstraint.constant += self.view.bounds.height*3
                self.view.layoutIfNeeded()
            }, completion: nil)
            certificateAnimationDone = true
        }
        
    }
    
    @IBAction func certificateButtonTapped(_ sender: UIButton) {
        if !workerAnimationDone {
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                self.workerButtonCenterConstraint.constant -= self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            workerAnimationDone = true
        }
        
    }
    
    @IBAction func workerButtonTapped(_ sender: UIButton) {
    }
    
    
    
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
