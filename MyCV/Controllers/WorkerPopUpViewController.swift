//
//  WorkerPopUpViewController.swift
//  MyCV
//
//  Created by Aleksandar Sajatovic on 6/14/19.
//  Copyright © 2019 Aleksandar Sajatovic. All rights reserved.
//

import UIKit

class WorkerPopUpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var workerTableView: UITableView!
    let jobs = PersonalInformations()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        workerTableView.delegate = self
        workerTableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        tableAnimation()
        //workerTableView.separatorStyle = .none
        workerTableView.separatorInset = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 185)
    }
    

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("popUpViewDissmised"), object: nil,userInfo: ["sender":Controller.worker])
        view.removeFromSuperview()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = jobs.getJobPosition(atYear: 2019 - indexPath.row)
        cell.detailTextLabel?.text = jobs.getEmployer(atYear: 2019 - indexPath.row)
        return cell
    }
    
    func tableAnimation() {
        workerTableView.reloadData()
        
        let cells = workerTableView.visibleCells
        let tableHeight = workerTableView.bounds.height
        let tableWidth = workerTableView.bounds.width
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: tableWidth/2, y: tableHeight)
        }
        
        var delay = 6.0
        
        for cell in cells {
            UIView.animate(withDuration: 1, delay: delay*0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = .identity
            }, completion: nil)
            delay += 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.textLabel?.numberOfLines = 0
        
        UIView.animate(withDuration: 0.4) {
            tableView.cellForRow(at: indexPath)?.indentationLevel = 3
            tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            tableView.layoutIfNeeded()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        UIView.animate(withDuration: 0.2) {
            tableView.cellForRow(at: indexPath)?.indentationLevel = 0
            tableView.cellForRow(at: indexPath)?.transform = .identity
            tableView.layoutIfNeeded()
        }
        
    }
    
    

}
