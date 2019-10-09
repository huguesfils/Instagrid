//
//  ViewController.swift
//  Instagrid
//
//  Created by Hugues Fils Caparos on 04/08/2019.
//  Copyright © 2019 Hugues Fils. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackViewTop: UIStackView!
    
    @IBOutlet weak var stackViewBottom: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var swipeChevron: UIImageView!
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            self.swipeLabel.text = "Swipe left to share"
            self.swipeChevron.image = UIImage(systemName: "chevron.left")
        }else{
            self.swipeLabel.text = "Swipe up to share"
            self.swipeChevron.image = UIImage(systemName: "chevron.up")
            
        }
    }
    
    
    @IBAction func tapLayout1(_ sender: UIButton) {
    }
    
    @IBAction func tapLayout2(_ sender: UIButton) {
    }
    
    @IBAction func tapLayout3(_ sender: UIButton) {
    }
    
    
    
}

