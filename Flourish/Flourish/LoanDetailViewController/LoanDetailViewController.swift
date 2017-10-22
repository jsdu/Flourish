//
//  LoanDetailViewController.swift
//  Flourish
//
//  Created by Jason Du on 10/21/17.
//  Copyright © 2017 Jason Du. All rights reserved.
//

import Foundation
import UIKit

class LoanDetailViewController: UIViewController {

    var data: Loan?
    
    @IBOutlet weak var tableView: UITableView!

    var paymentIndex = 0
    var offset = 0

    override func viewDidLoad() {
        let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
        let zoomAnimation = AnimationType.zoom(scale: 0.2)
        tableView.animateViews(animations: [fromAnimation, zoomAnimation], duration: 0.5)


        if let data = data {
            var index = 0
            for slot in data.slots {
                if slot.netAmount > 0 {
                    paymentIndex = index
                    if let status = slot.loanStatus {
                        if status == "COMPLETED" {
                            offset = 4
                        } else {
                            offset = 0
                        }
                    }
                }
                index += 1
            }
            self.title = data.purpose
        }
    }
}

extension LoanDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        if let data = data {
            for slot in data.slots {
                if let status = slot.loanStatus {
                    if status == "COMPLETED" {
                        if slot.netAmount > 0 {
                            rowCount += 3
                        } else {
                            rowCount += 1
                        }
                    } else {
                        rowCount += 1
                    }
                } else {
                    rowCount += 1
                }
            }
        }
        return rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell() }
        if indexPath.row < paymentIndex {

        } else if indexPath.row < paymentIndex + offset {

        }

    }
}
