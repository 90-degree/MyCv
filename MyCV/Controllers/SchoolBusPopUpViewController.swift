//
//  SchoolBusPopUpViewController.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/14/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import UIKit

class SchoolBusPopUpViewController: UIViewController {
    
    @IBOutlet weak var elementarySchoolLabel: UILabel!
    @IBOutlet weak var middleSchoolLabel: UILabel!
    
    @IBOutlet weak var elementarySchoolUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var middleSchoolUpConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        elementarySchoolLabel.text = PersonalInformations.elementarySchool
        middleSchoolLabel.text = PersonalInformations.highSchool
        
        elementarySchoolUpConstraint.constant += view.bounds.height
        middleSchoolUpConstraint.constant += view.bounds.height
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.4, delay: 0, options: .curveEaseInOut, animations: {
            self.elementarySchoolUpConstraint.constant -= self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut, animations: {
            self.middleSchoolUpConstraint.constant -= self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name("popUpViewDissmised"), object: nil,userInfo: ["sender":Controller.schoolBus])
        view.removeFromSuperview()
    }
    

}
