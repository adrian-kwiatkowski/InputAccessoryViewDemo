//
//  ViewController.swift
//  InputAccessoryViewDemo
//
//  Created by Adrian Kwiatkowski on 18/12/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var canBecomeFirstResponder: Bool { return true }
    
    var _inputAccessoryView: InputAccView!
    override var inputAccessoryView: InputAccView? {
        if _inputAccessoryView == nil {
            _inputAccessoryView = InputAccView.initFromNib()
            _inputAccessoryView.isHidden = true
        }
        
        return _inputAccessoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputAccessoryView?.hideButtonAction = {
            self.hideAccessoryView()
        }
    }
    
    func hideAccessoryView() {
        guard inputAccessoryView != nil else { return }
        UIView.animate(withDuration: 0.5, animations: {
            self.inputAccessoryView!.transform = CGAffineTransform(translationX: 0.0, y: self.inputAccessoryView!.frame.height)
            self.inputAccessoryView!.alpha = 0.0
        }, completion: { (finished) in
            self.inputAccessoryView!.transform = CGAffineTransform.identity
            self.inputAccessoryView!.alpha = 1.0
            self.inputAccessoryView!.isHidden = true
        })
    }
    
    @IBAction func showButtonTapped(_ sender: Any) {
        if inputAccessoryView != nil, inputAccessoryView!.isHidden {
            inputAccessoryView!.isHidden = false
            inputAccessoryView!.alpha = 0.0
            inputAccessoryView!.transform = CGAffineTransform(translationX: 0.0, y: inputAccessoryView!.frame.height)
            UIView.animate(withDuration: 0.5) {
                self.inputAccessoryView!.transform = CGAffineTransform.identity
                self.inputAccessoryView!.alpha = 1.0
            }
        }
    }
    
    @IBAction func endEditingButtonTapped(_ sender: Any) {
        view.endEditing(true)
        if inputAccessoryView?.isHidden == false { hideAccessoryView() }
    }
}

extension UIView {
    class func initFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?[0] as! T
    }
}
