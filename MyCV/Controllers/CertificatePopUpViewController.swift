//
//  CertificatePopUpViewController.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/14/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import UIKit

class CertificatePopUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var certificatePickerView: UIPickerView!
    
    @IBOutlet weak var slotBarButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    @IBOutlet weak var focusImageViewOutlet: UIImageView!
    
    var certificateArray = ["flutter_certificate","swift_certificate","multithreading_certificate","design_patterns"]

    override func viewDidLoad() {
        super.viewDidLoad()

        certificatePickerView.dataSource = self
        certificatePickerView.delegate = self
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        for _ in 0...3 {
            certificateArray.append(contentsOf: certificateArray)
        }
        
        certificatePickerView.selectRow(10, inComponent: 0, animated: true)
        certificatePickerView.selectRow(11, inComponent: 1, animated: true)
        certificatePickerView.selectRow(9, inComponent: 2, animated: true)
        
        
        slotBarButtonOutlet.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        focusImageViewOutlet.backgroundColor = nil
        focusImageViewOutlet.image = nil
        
        nextButtonOutlet.isHidden = true
    }
    

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("popUpViewDissmised"), object: nil,userInfo: ["sender":Controller.certificate])
        view.removeFromSuperview()
    }
    
    
    
    @IBAction func slotBarButtonTapped(_ sender: UIButton) {
        let randomA = Int.random(in: 1...18)
        let randomB = Int.random(in: 1...18)
        let randomC = Int.random(in: 1...18)
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            
            self.slotBarButtonOutlet.transform = CGAffineTransform(rotationAngle: -.pi/4)
        }, completion: nil)
        UIView.animate(withDuration: 0.2, delay: 0.4, options: .curveEaseOut, animations: {
            
            self.slotBarButtonOutlet.transform = .identity
        }, completion: nil)
        
        certificatePickerView.selectRow(randomA, inComponent: 0, animated: true)
        certificatePickerView.selectRow(randomB, inComponent: 1, animated: true)
        certificatePickerView.selectRow(randomC, inComponent: 2, animated: true)
        
        nextButtonOutlet.isHidden = false
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width:70, height: 100))
        
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 80))
        
       myImageView.image = UIImage(named: certificateArray[row])
        
        myView.addSubview(myImageView)
        
        
       return myView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        focusImageViewOutlet.image = UIImage(named: certificateArray[row])
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch: UITouch = touches.first {
            if touch.view != focusImageViewOutlet {
                focusImageViewOutlet.image = nil
            }
        }
    }

}
