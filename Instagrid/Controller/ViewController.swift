//
//  ViewController.swift
//  Instagrid
//
//  Created by Hugues Fils Caparos on 04/08/2019.
//  Copyright © 2019 Hugues Fils. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Layout{
        case layout1, layout2, layout3
    }
    
    @IBOutlet weak var stackViewTop: UIStackView!
    @IBOutlet weak var stackViewBottom: UIStackView!
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var swipeChevron: UIImageView!
    
    private var currentLayout = Layout.layout1
    
    var dictImage = [Int: UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLayout1()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            self.swipeLabel.text = "Swipe left to share"
            self.swipeChevron.image = UIImage(systemName: "chevron.left")
        }else{
            self.swipeLabel.text = "Swipe up to share"
            self.swipeChevron.image = UIImage(systemName: "chevron.up")
        }
    }
    
    func resetLayout(){
        stackViewTop.subviews.forEach { (item) in
            item.removeFromSuperview()
        }
        stackViewBottom.subviews.forEach { (item) in
            item.removeFromSuperview()
        }
    }
    
    func createButton(buttonId: Int) -> UIButton{
        let button = UIButton()
        button.setImage(UIImage(named: "Plus"), for: .normal)
        button.backgroundColor = UIColor.white
        button.imageView?.contentMode = .scaleAspectFill
        button.tag = buttonId
        button.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        return button
    }
    
    @objc func pressedButton(sender: UIButton){
        print("ok: \(sender.tag)")
//        sender.setImage = imagerécupérée
//        dictImage [sender.tag] = image récupérée
    }
    
    func createLayout1(){
        self.stackViewTop.addArrangedSubview(createButton(buttonId: 1))
        self.stackViewBottom.addArrangedSubview(createButton(buttonId: 2))
        self.stackViewBottom.addArrangedSubview(createButton(buttonId: 3))
    }
    
    func createLayout2(){
        self.stackViewTop.addArrangedSubview(createButton(buttonId: 1))
        self.stackViewTop.addArrangedSubview(createButton(buttonId: 2))
        self.stackViewBottom.addArrangedSubview(createButton(buttonId: 3))
    }
    
    func createLayout3(){
        self.stackViewTop.addArrangedSubview(createButton(buttonId: 1))
        self.stackViewTop.addArrangedSubview(createButton(buttonId: 2))
        self.stackViewBottom.addArrangedSubview(createButton(buttonId: 3))
        self.stackViewBottom.addArrangedSubview(createButton(buttonId: 4))
    }
    
    @IBAction func tapLayout1(_ sender: UIButton) {
        if currentLayout != .layout1{
            resetLayout()
            createLayout1()
            currentLayout = .layout1
        }
        
    }
    
    @IBAction func tapLayout2(_ sender: UIButton) {
        if currentLayout != .layout2{
            resetLayout()
            createLayout2()
            currentLayout = .layout2
        }
    }
    
    @IBAction func tapLayout3(_ sender: UIButton) {
        if currentLayout != .layout3{
            resetLayout()
            createLayout3()
            currentLayout = .layout3
        }
    }
    
    
    
}


