//
//  NetworkService.swift
//  Alamofire_Simple_Example
//
//  Created by Shanmuganathan on 10/03/20.
//  Copyright © 2020 Shanmuganathan. All rights reserved.
//

import UIKit
import Alamofire

class NetworkServie: NSObject {

    func sendRequest(url : URL, completion: @escaping (_ response: HTTPURLResponse, _ statusCode: Int?) -> Void)  {
        AF.request(url).response { response in
            guard let response = response.response else {return}
            debugPrint(response.statusCode)
            completion(response, response.statusCode)
        }
    }
}
