//
//  DestinationViewController.swift
//  notifinationCenterApp
//
//  Created by Sky Xu on 2/4/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //    MARK: post notifictaion when click on button
    @IBAction func peruButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: .peru, object: nil)
    }
    
    
    @IBAction func argentinaButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: .agentina, object: nil)
    }
}
