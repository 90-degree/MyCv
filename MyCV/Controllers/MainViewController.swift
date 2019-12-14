//
//  MainViewController.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/12/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var scrollViewOutlet: UIScrollView!
    
    @IBOutlet weak var babyButtonOutlet: UIButton!
    @IBOutlet weak var babyButtonCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var schoolBusButtonOutlet: UIButton!
    @IBOutlet weak var schoolBusCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var universityButtonOutlet: UIButton!
    @IBOutlet weak var universityButtonUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var universityButtonCenterConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var certificateButtonOutlet: UIButton!
    @IBOutlet weak var certificateButtonUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var certificateButtonCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var workerButtonOutlet: UIButton!
    @IBOutlet weak var workerButtonCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var motivationButtonOutlet: UIButton!
    @IBOutlet weak var motivationButtonCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var contactsButtonOutlet: UIButton!
    @IBOutlet weak var contactsButtonCenterConstraint: NSLayoutConstraint!
    
    
    var babyAnimationDone = false
    var schoolBusAnimationDone = false
    var universityAnimationDone = false
    var certificateAnimationDone = false
    var workerAnimationDone = false
    var motivationAnimationDone = false
    var contactsAnimationDone = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        babyButtonCenterConstraint.constant += view.bounds.width
        schoolBusCenterConstraint.constant -= view.bounds.width
        universityButtonCenterConstraint.constant += view.bounds.width
        certificateButtonCenterConstraint.constant -= view.bounds.width
        workerButtonCenterConstraint.constant += view.bounds.width
        contactsButtonCenterConstraint.constant -= view.bounds.width
        motivationButtonCenterConstraint.constant += view.bounds.width
        

        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.nextAnimation), name: NSNotification.Name(rawValue: "popUpViewDissmised"), object: nil)
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        babyAnimationDone = buttonAnimation(forButtonConstraint: babyButtonCenterConstraint, direction: .fromRight, isDone: babyAnimationDone)
    }
    

    @IBAction func babyButtonTapped(_ sender: UIButton) {
        
        getPopUp(asViewController: .baby)
    }
    
    @IBAction func schoolBusButtonTapped(_ sender: UIButton) {
        
        getPopUp(asViewController: .schoolBus)
    }
    
    @IBAction func universityButtonTapped(_ sender: UIButton) {
        
        getPopUp(asViewController: .university)
    }
    
    @IBAction func certificateButtonTapped(_ sender: UIButton) {
        
        getPopUp(asViewController: .certificate)
    }
    
    @IBAction func workerButtonTapped(_ sender: UIButton) {
        getPopUp(asViewController: .worker)
    }
    
    @IBAction func motivationButtonTapped(_ sender: UIButton) {
        getPopUp(asViewController: .motivation)
    }
    
    
    @IBAction func contactsButtonTapped(_ sender: UIButton) {
        
        getPopUp(asViewController: .contacts)
    }
    
    
    
    func getPopUp(asViewController vc: Controller) {
        var controller: UIViewController?
        
        switch vc {
        case .baby:
            controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vc.rawValue) as! BabyPopUpViewController
        case .schoolBus:
            controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vc.rawValue) as! SchoolBusPopUpViewController
        case .university:
            controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vc.rawValue) as! UniversityPopUpViewController
        case .certificate:
            controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vc.rawValue) as! CertificatePopUpViewController
        case .worker:
            controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vc.rawValue) as! WorkerPopUpViewController
        case .motivation:
            controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vc.rawValue) as! MotivationPopUpViewController
        case .contacts:
            controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vc.rawValue) as! ContactsViewController
        }
        
        if let popUpVC = controller {
            self.addChild(popUpVC)
            popUpVC.view.frame = self.view.frame
            self.view.addSubview(popUpVC.view)
            popUpVC.didMove(toParent: self)
        }
    }
    
    
    
    func buttonAnimation(forButtonConstraint constraint: NSLayoutConstraint, direction: Direction, isDone: Bool) -> Bool {
        if !isDone {
            UIView.animate(withDuration: 0.6, delay: 0.1, options: .transitionCrossDissolve, animations: {
                constraint.constant += (self.view.bounds.width) * CGFloat(direction.rawValue)
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        return true
    }
    
    
    @objc func nextAnimation(note: Notification) {
        if let info = note.userInfo?["sender"] as? Controller{
            switch info {
            case .baby:
                schoolBusAnimationDone = buttonAnimation(forButtonConstraint: schoolBusCenterConstraint, direction: .fromLeft, isDone: schoolBusAnimationDone)
                //slide(toButton: schoolBusButtonOutlet)
            case .schoolBus:
                universityAnimationDone = buttonAnimation(forButtonConstraint: universityButtonCenterConstraint, direction: .fromRight, isDone: universityAnimationDone)
                slide(toButton: universityButtonOutlet)
            case .university:
                certificateAnimationDone = buttonAnimation(forButtonConstraint: certificateButtonCenterConstraint, direction: .fromLeft, isDone: certificateAnimationDone)
                slide(toButton: certificateButtonOutlet)
            case .certificate:
                workerAnimationDone = buttonAnimation(forButtonConstraint: workerButtonCenterConstraint, direction: .fromRight, isDone: workerAnimationDone)
                slide(toButton: workerButtonOutlet)
            case .worker:
                contactsAnimationDone = buttonAnimation(forButtonConstraint: contactsButtonCenterConstraint, direction: .fromLeft, isDone: contactsAnimationDone)
                slide(toButton: contactsButtonOutlet)
            case .contacts:
                motivationAnimationDone = buttonAnimation(forButtonConstraint: motivationButtonCenterConstraint, direction: .fromRight, isDone: motivationAnimationDone)
                slide(toButton: motivationButtonOutlet)
            case .motivation:
                print("contacts")
            }
        }
    }
    
    
    func slide(toButton: UIButton) {
        var point = toButton.frame.origin
        point.x += toButton.frame.width/2 - view.frame.width/2
        point.y -= CGFloat(view.bounds.height/1.9)
        scrollViewOutlet.setContentOffset(point, animated: true)
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

