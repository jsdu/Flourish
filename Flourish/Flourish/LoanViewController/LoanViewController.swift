//
//  LoanViewController.swift
//  Flourish
//
//  Created by Jason Du on 10/21/17.
//  Copyright © 2017 Jason Du. All rights reserved.
//

import Foundation
import UIKit

class LoanViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let loanInProgressArr = ["",""]
    let loanCompleteArr = ["","",""]

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } 
    }

    override func viewWillAppear(_ animated: Bool) {
        Network.createUser(success: { _ in
            print("LOL")
        })
        tableView.reloadData()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
}

extension LoanViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loanInProgressArr.count + loanCompleteArr.count + 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoanDashBoardCell") as! LoanDashBoardCell
            return cell
        } else if indexPath.row <= loanInProgressArr.count  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoanInProgressCell") as! LoanInProgressCell
            return cell
        } else if indexPath.row == loanInProgressArr.count + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoanHeaderCell") as! LoanHeaderCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoanCompleteCell") as! LoanCompleteCell
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 220.0
        } else if indexPath.row <= loanInProgressArr.count  {
            return 250.0
        } else if indexPath.row == loanInProgressArr.count + 1 {
            return 45.0
        } else {
            return 115.0
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        } else if indexPath.row <= loanInProgressArr.count  {
        }
    }
}

extension UINavigationController
{
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

