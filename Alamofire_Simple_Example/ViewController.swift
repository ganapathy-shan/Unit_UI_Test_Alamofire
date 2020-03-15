//
//  ViewController.swift
//  Alamofire_Simple_Example
//
//  Created by Shanmuganathan on 10/03/20.
//  Copyright © 2020 Shanmuganathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendRequestBtnAction(_ sender: Any) {
        let service = NetworkServie()
        service.sendRequest(url:URL(string: urlToRequest)!) { (response, status) in
            guard let status = status else {return}
            if (status == 404)
            {
                let alertController = UIAlertController(title: "Test app Alert", message: "Got 404 Response", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }


}

