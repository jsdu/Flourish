//
//  LoanHeaderCell.swift
//  Flourish
//
//  Created by Jason Du on 10/21/17.
//  Copyright © 2017 Jason Du. All rights reserved.
//

import Foundation
import UIKit

class LoanDashBoardCell: UITableViewCell {
    
    @IBOutlet weak var addButton: UIButton!

    override func layoutSubviews() {
        addButton.layer.cornerRadius = addButton.frame.height / 2
    }
}
