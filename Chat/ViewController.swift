//
//  ViewController.swift
//  Chat
//
//  Created by Edgar Rico on 26/02/22.
//

import UIKit

class ViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidAppear(true)
        
        let isLoggenIn = UserDefaults.standard.bool(forKey: "loogen_in")
        
        
    }


}

