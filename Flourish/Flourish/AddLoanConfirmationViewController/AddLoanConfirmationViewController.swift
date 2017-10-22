//
//  AddLoanConfirmationViewController.swift
//  Flourish
//
//  Created by Jason Du on 10/21/17.
//  Copyright © 2017 Jason Du. All rights reserved.
//

import Foundation
import UIKit

class AddLoanConfirmationViewController: UIViewController {

    var data: DataSend?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        
    }
}

extension AddLoanConfirmationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableArr = data?.tableArr {
            return tableArr.count + 1
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tableArr = data?.tableArr {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "") as! AddLoan
            }
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
