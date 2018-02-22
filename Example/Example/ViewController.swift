//
//  ViewController.swift
//  Example
//
//  Created by Furqan on 21.02.18.
//  Copyright © 2018 Furqan. All rights reserved.
//

import UIKit
import NotificationBar

class ViewController: UIViewController {
    
    @IBAction func showLoading(_ sender: Any) {
        let nf = NotificationBar(over: self, text: "The content is being loaded...", style: .loading)
        nf.show()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

