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
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        customView.backgroundColor = UIColor.white
        self.stackViewTop.addArrangedSubview(customView)
        let customView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        customView2.backgroundColor = UIColor.white
        self.stackViewBottom.addArrangedSubview(customView2)
        let customView3 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        customView3.backgroundColor = UIColor.white
        self.stackViewBottom.addArrangedSubview(customView3)
        
    }
    
    @IBAction func tapLayout2(_ sender: UIButton) {
       
    }
    
    @IBAction func tapLayout3(_ sender: UIButton) {

    }
    
    
    
}

