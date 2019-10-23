//
//  ViewController.swift
//  Instagrid
//
//  Created by Hugues Fils Caparos on 04/08/2019.
//  Copyright © 2019 Hugues Fils. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private enum Layout{
        case layout1, layout2, layout3
    }
    
    @IBOutlet weak var stackViewTop: UIStackView!
    @IBOutlet weak var stackViewBottom: UIStackView!
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var swipeChevron: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    private var currentLayout = Layout.layout1
    private var currentBtnTag = 0
    
    let pickerController = UIImagePickerController()
    var dictImage = [Int: UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLayout1()
        pickerController.delegate = self
        pickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        pickerController.sourceType = .photoLibrary
        pickerController.modalPresentationStyle = UIModalPresentationStyle.currentContext
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(clearView))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeToShare))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
       
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            self.swipeLabel.text = "Swipe left to share"
            self.swipeChevron.image = UIImage(systemName: "chevron.left")
        }else{
            self.swipeLabel.text = "Swipe up to share"
            self.swipeChevron.image = UIImage(systemName: "chevron.up")
        }
        if UIDevice.current.orientation.isLandscape{
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeToShare))
            swipeLeft.direction = .left
            view.addGestureRecognizer(swipeLeft)
        }
        
    }
    
    @objc func swipeToShare(){
        shareImage()
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
    
    func getBtn(tag: Int) -> UIButton? {
        for item in stackViewTop.subviews{
            if item.tag == tag{
                return item as? UIButton
            }
        }
        for item in stackViewBottom.subviews{
            if item.tag == tag{
                return item as? UIButton
            }
        }
        return nil
    }
    
    @objc func pressedButton(sender: UIButton){
        currentBtnTag = sender.tag
        showPickerController()
    }
    
    func showPickerController() {
        present(pickerController, animated: true, completion: nil)
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
            restoreImage()
        }
        
    }
    
    @IBAction func tapLayout2(_ sender: UIButton) {
        if currentLayout != .layout2{
            resetLayout()
            createLayout2()
            currentLayout = .layout2
            restoreImage()
        }
    }
    
    @IBAction func tapLayout3(_ sender: UIButton) {
        if currentLayout != .layout3{
            resetLayout()
            createLayout3()
            currentLayout = .layout3
            restoreImage()
        }
    }
    
    func restoreImage(){
        for i in 1...4{
            if dictImage[i] == nil{
                getBtn(tag: i)?.setImage(UIImage(named: "Plus"), for: .normal)
            }else{
                getBtn(tag: i)?.setImage(dictImage[i], for: .normal)
            }
        }
    }
    
    @objc func clearView(_ sender: UIButton){
        for i in 1...4{
            getBtn(tag: i)?.setImage(UIImage(named: "Plus"), for: .normal)
        }
        dictImage.removeAll()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            dictImage[currentBtnTag] = image
            getBtn(tag: currentBtnTag)?.setImage(image, for: .normal)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func getImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: mainView.bounds.size)
        let newImage = renderer.image { ctx in
            mainView.drawHierarchy(in: mainView.bounds, afterScreenUpdates: true)
        }
        return newImage
    }
    
    func shareImage(){
        let newImage = self.getImage()
        let item = [newImage]
        let share = UIActivityViewController(activityItems: item, applicationActivities: nil); present(share, animated: true)
    }
    
}


