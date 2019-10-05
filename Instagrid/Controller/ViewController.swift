//
//  ViewController.swift
//  Instagrid
//
//  Created by Hugues Fils Caparos on 04/08/2019.
//  Copyright © 2019 Hugues Fils. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var chevronLabel: UILabel!
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            self.swipeLabel.text = "Swipe left to share"
            self.chevronLabel.text = "<"
        }else{
            self.swipeLabel.text = "Swipe up to share"
            self.chevronLabel.text = "^"
            
        }
    }
}

