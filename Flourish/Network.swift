//
//  Network.swift
//  Flourish
//
//  Created by Jason Du on 10/21/17.
//  Copyright © 2017 Jason Du. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public typealias SuccessBlock = (Any?) -> Void
public typealias FailureBlock = (Any?) -> Void

open class Network {
    static let base = "http://ec2-18-221-49-193.us-east-2.compute.amazonaws.com/graphql"
    static let header: HTTPHeaders = ["Content-Type": "application/graphql"]
    open class func createUser(success: @escaping SuccessBlock) {
        let parameters: Parameters = ["query": "{ me(userId: \"137\") { firstName lastName trust activeLoans { amount slots { netAmount loanStatus settleReason settleBy settledOn settledWith settlementHash } startDate purpose } pastLoans { amount slots { netAmount loanStatus settleReason settleBy settledOn settledWith settlementHash } startDate purpose } } }"]

        Alamofire.request(base, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print(response)
        }
    }

}
