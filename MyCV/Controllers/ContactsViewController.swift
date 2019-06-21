//
//  ContactsViewController.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/18/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var finishButtonOutlet: UIButton!
    
    @IBOutlet weak var emailButtonOutlet: UIButton!
    
    @IBOutlet weak var gitButtonOutlet: UIButton!
    
    @IBOutlet weak var phoneButtonOutlet: UIButton!
    
    @IBOutlet weak var contentViewOutlet: UIView!
    
    @IBOutlet weak var linkedInButtonOutlet: UIButton!
    
    @IBOutlet weak var viberButtonOutlet: UIButton!
    
    @IBOutlet weak var cardViewOutlet: UIView!
    
    @IBOutlet weak var cardViewTopConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var logoImageViewOutlet: UIImageView!
    
    @IBOutlet weak var textLabelOutlet: UILabel!
    
    
    var tapCounter = 0
    var cardIsVisible = false
    var lastContact = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(1)
        cardViewTopConstraint.constant -= 100
        contentViewOutlet.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        emailButtonOutlet.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        phoneButtonOutlet.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        linkedInButtonOutlet.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        gitButtonOutlet.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        viberButtonOutlet.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        
        
    }
    
    @IBAction func gitButtonTapped(_ sender: UIButton) {
        getCard(forContact: .git)
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        getCard(forContact: .email)
    }
    
    @IBAction func phoneButtonTapped(_ sender: UIButton) {
        getCard(forContact: .phone)
    }
    
    
    @IBAction func linkedInButtonTapped(_ sender: UIButton) {
        getCard(forContact: .linkedIn)
    }
    
    
    @IBAction func viberButtonTapped(_ sender: UIButton) {
        getCard(forContact: .viber)
    }
    
    
    
    
    @IBAction func finishButtonTapped(_ sender: UIButton) {

        addPuls()
        
        switch tapCounter {
        case 0:
            UIView.animate(withDuration: 0.6) {
                self.emailButtonOutlet.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        case 1:
            UIView.animate(withDuration: 0.6) {
                self.phoneButtonOutlet.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        case 2:
            UIView.animate(withDuration: 0.6) {
                self.gitButtonOutlet.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        case 3:
            UIView.animate(withDuration: 0.6) {
                self.linkedInButtonOutlet.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        case 4:
            UIView.animate(withDuration: 0.6) {
                self.viberButtonOutlet.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        case 5:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.finishButtonOutlet.transform = CGAffineTransform(rotationAngle: .pi/2)
                self.finishButtonOutlet.setImage(UIImage(named: "antena_broken"), for: .normal)
                self.finishButtonOutlet.setTitle(nil, for: .normal)
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        default:
            NotificationCenter.default.post(name: NSNotification.Name("popUpViewDissmised"), object: nil,userInfo: ["sender":Controller.contacts])
            view.removeFromSuperview()
        }
        tapCounter += 1
    }
    
    
    
    
    func addPuls() {
        let puls = Pulsing(numberOfPulses: 1, radius: 100, position: CGPoint(x: view.bounds.width/2, y: view.bounds.height/2 + 130))
        puls.animationDuration = 0.4
        puls.backgroundColor = UIColor.red.cgColor
        view.layer.insertSublayer(puls, below: finishButtonOutlet.layer)
    }
    
    
    
    
    func getCard(forContact contact: Contacts) {
        
        
        switch contact {
        case .email:
            logoImageViewOutlet.image = UIImage(named: contact.rawValue)
            textLabelOutlet.text = "90stepeni@gmail.com"
        case .git:
            logoImageViewOutlet.image = UIImage(named: contact.rawValue)
            textLabelOutlet.text = "90-degree"
        case .linkedIn:
            logoImageViewOutlet.image = UIImage(named: contact.rawValue)
            textLabelOutlet.text = "Aleksandar Šajatović"
        case .phone:
            logoImageViewOutlet.image = UIImage(named: contact.rawValue)
            textLabelOutlet.text = "+381 62 61 62 70"
        case .viber:
            logoImageViewOutlet.image = UIImage(named: contact.rawValue)
            textLabelOutlet.text = "+381 62 61 62 70"
        }
        
        
        
        if !cardIsVisible {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.cardViewTopConstraint.constant += 100
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        else if cardIsVisible && lastContact != contact.rawValue{
            lastContact = contact.rawValue
            return
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.cardViewTopConstraint.constant -= 100
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        cardIsVisible.toggle()
        lastContact = contact.rawValue
    }
    

}
