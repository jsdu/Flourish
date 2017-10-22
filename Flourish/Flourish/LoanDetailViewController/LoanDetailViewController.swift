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

    override func viewDidLoad() {
        let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
        let zoomAnimation = AnimationType.zoom(scale: 0.2)
//        tableView.animateViews(animations: [fromAnimation, zoomAnimation], duration: 0.5)
    }
}

//extension LoanDetailViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let loan = loan {
//            var numRows = 0
//            for transaction in loan.transactionArr {
//                if let payment = transaction.paymenent {
//                    numRows += payment.count
//                } else if transaction.request != nil {
//                    numRows += 1
//                }
//            }
//            return numRows
//        }
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let loan = loan else { return UITableViewCell() }
//
//        if indexPath.row < paymentIndex {
//            let transaction = loan.transactionArr[indexPath.row]
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHeaderCell") as! TransactionHeaderCell
//            cell.transaction = transaction
//            colorCircleView(circleView: cell.circleIndicatorView, week: transaction.week)
//
//            return cell
//        } else if indexPath.row >= paymentIndex && indexPath.row < paymentIndex + offset  {
//            // This is a payment
//            let transaction = loan.transactionArr[paymentIndex]
//            if indexPath.row == paymentIndex {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHeaderCell") as! TransactionHeaderCell
//                cell.transaction = transaction
//                colorCircleView(circleView: cell.circleIndicatorView, week: transaction.week)
//                return cell
//            } else {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionBodyCell") as! TransactionBodyCell
//                return cell
//            }
//        } else {
//            let transaction = loan.transactionArr[indexPath.row - offset + 1]
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHeaderCell") as! TransactionHeaderCell
//            cell.transaction = transaction
//            colorCircleView(circleView: cell.circleIndicatorView, week: transaction.week)
//            return cell
//        }
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row < paymentIndex {
//            return 190
//        } else if indexPath.row >= paymentIndex && indexPath.row < paymentIndex + offset  {
//            if indexPath.row == paymentIndex {
//                return 190
//            } else {
//                return 150
//            }
//        } else {
//            return 190
//        }
//    }
//}

