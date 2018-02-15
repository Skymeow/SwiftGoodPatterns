//
//  ViewController.swift
//  notifinationCenterApp
//
//  Created by Sky Xu on 2/4/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit

class ChooseDestinationViewController: UIViewController {

    @IBOutlet weak var cityChoosenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //   MARK: Observer when the label of city choose change, it post a notificaiton to the channel
        NotificationCenter.default.addObserver(self, selector: #selector(setToPeru(notification:)), name: .peru, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setToArgentina(notification:)), name: .agentina, object: nil)
    }
    
    @objc func setToPeru(notification: NSNotification) {
        cityChoosenLabel.text = "Peru"
    }
    
    @objc func setToArgentina(notification: NSNotification) {
        cityChoosenLabel.text = "Argentina"
    }
    
    

}

