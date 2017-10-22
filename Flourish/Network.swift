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
//        Alamofire.request(base) { result in
//            switch result {
//            case .success(let response):
//                let json = JSON(response.data)
//                guard let userId = json[Param.id].int else { return }
//                let defaults = UserDefaults.standard
//                defaults.set(userId, forKey: "user_id")
//                success(true)
//            case .failure(let error):
//                failure(error)
//            }
        let parameters: Parameters = ["query": "{ user(id: 1337) { firstName favoriteAminal } }"]

        Alamofire.request(base, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print(response)
        }
    }

}
